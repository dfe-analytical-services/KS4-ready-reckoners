/* AB - not sure of the purpose of this code anymore 27/01/23


Code to produce adjusted progress 8 scores
Produced by Mike Williams, June 2018: using dummy 2018 pupil data ([KS4_pupil_18_dryrun_unamended_v3])
Updated by Neil Ross, January 2019: the capping rules are first published in October in the secondary school tech guide
and should use the fixed version of the unamended data i.e. new_KS4_pupil_18_unamended_v2
*/

--this ensures all temporary tables are dropped prior to running the code
drop table #step1
drop table #step2
drop table #step3
drop table #step4
drop table #step5
drop table #step6

/*
FOR NOW, THIS CODE SHOULD NOT SIMPLY BE RUN FROM TOP TO BOTTOM IN ONE GO. PLEASE RUN IN STAGES BECAUSE STAGE 2 INVOLVES 3 SUBSECTIONS OF MANUAL USER ENTRY.THERE ARE THREE STAGES
*/

/*STAGE 1*/

--this piece of code groups pupils included within the P8 model according to prior attainment
--it also calculates the average p8 score for each group, the standard deviation of the p8 scores for each group
--We will only cap extreme negative p8 scores within each group

Use KS4_RESTRICTED --AB
go
Select [KS2EMSS_GRP], --AB changed all [KS2EMFG_GRP] in document for [KS2EMSS_GRP]
Count([KS2EMSS_GRP]) as [Pupils within each prior attainment group],
avg([P8SCORE]) as [Average P8 score],
round(stdev([P8SCORE]),6) as [Standard deviation P8 score]
into #step1
from [dbo].[ks4_pupil_22_result_amended_v2]
--from [Outputs].[Pupil_PT_KS4_20220714_180100]
--from [dbo].[KS4_pupil_19_amended_v3] --AB
--from [dbo].[KS4_pupil_19_amended_v2]
--from [dbo].[KS4_pupil_19_unamended_v4]
where [INP8MOD]=1
group by [KS2EMSS_GRP]
order by [KS2EMSS_GRP] ASC

/* this piece of code calculates a p8 Z score for each individual pupil. This uses their actual p8 score and
the relevant average and standard deviation of p8 scores for the prior attainment group that the pupil is in */

Select ((a.[P8SCORE]-b.[Average P8 score])/b.[Standard deviation P8 score]) as [Pupil level Z score], 
a.candno
--a.urn
into #step2
from [dbo].[ks4_pupil_22_result_amended_v2] as a
--from [Outputs].[Pupil_PT_KS4_20220714_180100] as a 
--from [dbo].[KS4_pupil_19_amended_v3] as a --AB
--from [dbo].[KS4_pupil_19_amended_v2] as a
--from [dbo].[KS4_pupil_19_unamended_v4] as a
left join #step1 as b
on a.[KS2EMSS_GRP]=b.[KS2EMSS_GRP] --AB
where [INP8MOD]=1

--this piece of code calculates the number of pupils in the P8 model and works out 1% of those
Select count([pupil level Z score]) as [Number of pupils],
round((count([pupil level Z score]))*1/100, 0) as [1% of pupils]
into #step3
from #step2

--this piece of code identifies the pupil and Z score needed for setting the adjustment
Select * from #step3

/*STAGE 2*/

--USER TO INSERT A VALUE IN THIS SECTION (1):
Select top /* insert value of the figure for 1% of pupils identified from #step3 above>>>>>*/ /*5326 --AB new value pasted in here and all relevant places below*/ 5426 * 
from #step2
order by [pupil level Z score] asc

-- the pupil level z score where approx 1% of pupils are below is -2.89485569482951 [dummy = -2.93475481228276 --AB not sure what this dummy value means]
--This is identified by scrolling to the very bottom of the output produced by the snippet
--of code directly above (looking at the Pupil level Z score column)
--RM prefer rounding to 10 dp. Doing the same here gives -2.8948556948

--USER TO INSERT A VALUE IN THIS SECTION (2):
--this piece of code flags whether or not an individual pupil should have their p8 score adjusted.
--scores are capped if the pupil p8 Z score is less than the SD for adjustment identified above

Select *, case
when (([Pupil level Z score])</*insert the rounded constant here>>>>>>>>*/-2.8948556948) then 1 else 0 end as [pupil adjusted]
into #step4
from #step2

--USER TO INSERT A VALUE IN THIS SECTION (3):
--this piece of code works out the lower adjustment threshold for each prior attainment group
Select *, [Standard deviation P8 score]*/*insert the rounded constant here>>>>>>>>*/-2.8948556948 as [Adjusted SD PAG]
into #step5
from #step1

/*STAGE 3*/

--this piece of code pulls together the key inforamtion on each pupil, for example,
--whether they have been capped, what their capped score is, what their uncapped score is and so on
select a.laestab, 
a.candno, 
a.inp8mod, 
a.ks2emss_grp, --AB
a.att8, 
a.p8score,
b.[pupil adjusted],
case when b.[pupil adjusted]=1 then c.[Adjusted SD PAG] else [P8SCORE] end as [P8adj]
into #step6
from [dbo].[ks4_pupil_22_result_amended_v2] as a
--from [Outputs].[Pupil_PT_KS4_20220714_180100] as a
--from [dbo].[KS4_pupil_19_amended_v3] as a  --AB
--from [dbo].[KS4_pupil_19_amended_v2] as a
--from [dbo].[KS4_pupil_19_unamended_v4] as a
left join #step4 as b
on a.candno=b.candno
left join #step5 as c
on a.ks2emss_grp=c.ks2emss_grp --AB
where a.[INP8MOD]=1

Select * from #step6

--this piece of code shows how many pupils within each prior attainment group have been capped.
--some groups have had no pupils capped and the % of pupils capped within each group can be more than 1%
--as long as overall, we only cap around 1% of pupils
Select ks2emss_grp, sum([pupil adjusted])  --AB
from #step6
group by ks2emss_grp  --AB
order by ks2emss_grp asc  --AB

--this piece of code produces the individual thresholds needed for the RM lookup table
Select [KS2EMSS_GRP], [Adjusted SD PAG] from #step5  --AB
order by [KS2EMSS_GRP] asc  --AB

--this piece of code produces unadjusted and adjusted CIs.
--TO DO