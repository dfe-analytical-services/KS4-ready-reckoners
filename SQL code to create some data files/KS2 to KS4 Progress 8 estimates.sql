Use KS4_RESTRICTED
go

/* STAGE1
-- progress 8 estimates (and component parts) for the Model Values/Coeffiecients section of the ready reckoners
*/


select 
--ks2emfg_grp,  --AB
ks2emss_grp,
round(avg(att8),2) as p8est,
round(avg(slot1eng),2) as p8esteng,
round(avg(slot2mat),2) as p8estmat,
round(avg(ebacscr),2) as p8estebac,
round(avg(openscr),2) as p8estopen,
round(avg(opengscr),2) as p8estopeng,
round(avg(openngscr),2) as p8estopenng
from [dbo].[KS4_pupil_22_result_amended_v2]
--from [Outputs].[Pupil_PT_KS4_20220714_180100]
--from [dbo].[KS4_pupil_19_amended_v3]  --AB
--from [dbo].[KS4_pupil_19_amended_v2]
--from [dbo].[KS4_pupil_19_unamended_v4]
where inp8mod=1
--group by ks2emfg_grp --AB
--order by ks2emfg_grp --AB
group by ks2emss_grp
order by ks2emss_grp


/* STAGE 2
-- the following code is used to update the Model Values sheet in the Ebacc Pupil Ready Reckoner
*/


select 
--ks2emfg_grp,  --AB
ks2emss_grp,
round(avg(case when inscivamod_ptq_ee=1 then ebptssci_ptq_ee else null end),2) as sciest,
round(avg(case when inhumvamod_ptq_ee=1 then ebptshum_ptq_ee else null end),2) as humest,
round(avg(case when inlanvamod_ptq_ee=1 then ebptslan_ptq_ee else null end),2) as lanest
from [dbo].[KS4_pupil_22_result_amended_v2]
--from [Outputs].[Pupil_PT_KS4_20220714_180100]
--from [dbo].[KS4_pupil_19_amended_v3] --AB
--from [dbo].[KS4_pupil_19_amended_v2]
--from [dbo].[KS4_pupil_19_unamended_v4]
where ks2emss_grp>0
group by ks2emss_grp
order by ks2emss_grp
--where ks2emfg_grp>0 --AB
--group by ks2emfg_grp --AB
--order by ks2emfg_grp --AB

/*STAGE 3
-- standard deviations for the school level RRs and CIs
*/

drop table #est
select 
--ks2emfg_grp, --AB
ks2emss_grp,
avg(att8) as p8est,
avg(slot1eng) as p8esteng,
avg(slot2mat) as p8estmat,
avg(ebacscr) as p8estebac,
avg(openscr) as p8estopen
into #est
from [dbo].[KS4_pupil_22_result_amended_v2]
--from [Outputs].[Pupil_PT_KS4_20220714_180100]
--from [dbo].[KS4_pupil_19_amended_v3] --AB
--from [dbo].[KS4_pupil_19_amended_v2] --AB
--from [dbo].[KS4_pupil_19_unamended_v4] --AB
where inp8mod=1
--group by ks2emfg_grp --AB
group by ks2emss_grp

drop table #est2
select 
--ks2emfg_grp, --AB
ks2emss_grp,
avg(case when inscivamod_ptq_ee=1 then ebptssci_ptq_ee else null end) as sciest,
avg(case when inhumvamod_ptq_ee=1 then ebptshum_ptq_ee else null end) as humest,
avg(case when inlanvamod_ptq_ee=1 then ebptslan_ptq_ee else null end) as lanest
into #est2
from [dbo].[KS4_pupil_22_result_amended_v2]
--from [Outputs].[Pupil_PT_KS4_20220714_180100]
--from [dbo].[KS4_pupil_19_amended_v3] --AB
--from [dbo].[KS4_pupil_19_amended_v2] --AB
--from [dbo].[KS4_pupil_19_unamended_v4] --AB
--where ks2emfg_grp>0 --AB
--group by ks2emfg_grp --AB
where ks2emss_grp>0
group by ks2emss_grp


select 
round(stdev(p8score),6) as p8stdev,
--round(stdev((att8-p8est)/10),6) as p8stdev,
round(stdev((slot1eng-p8esteng)/2),6) as p8engstdev,
round(stdev((slot2mat-p8estmat)/2),6) as p8matstdev,
round(stdev((ebacscr-p8estebac)/3),6) as p8ebacstdev,
round(stdev((openscr-p8estopen)/3),6) as p8openstdev,
round(stdev(case when inscivamod_ptq_ee=1 then ebptssci_ptq_ee-sciest else null end),6) as scivastdev,
round(stdev(case when inhumvamod_ptq_ee=1 then ebptshum_ptq_ee-humest else null end),6) as humvastdev,
round(stdev(case when inlanvamod_ptq_ee=1 then ebptslan_ptq_ee-lanest else null end),6) as lanvastdev
from [dbo].[KS4_pupil_22_result_amended_v2] p
--from [Outputs].[Pupil_PT_KS4_20220714_180100] p
--from [dbo].[KS4_pupil_19_amended_v3] p  --AB
--from [dbo].[KS4_pupil_19_amended_v2] p
--from [dbo].[KS4_pupil_19_unamended_v4] p
inner join #est e
--on p.ks2emfg_grp=e.ks2emfg_grp --AB
on p.ks2emss_grp=e.ks2emss_grp
--left join #est2 e2 on p.ks2emfg_grp=e2.ks2emfg_grp --AB
left join #est2 e2 on p.ks2emss_grp=e2.ks2emss_grp
where inp8mod=1



-- code no longer in use?
/* --AB
select ks2emfg_grp, max(att8_pred), max(eng_pred), max(mat_pred), max(ebac_pred), max(open_pred),
max(scivapred_ptq_ee), max(humvapred_ptq_ee), max(lanvapred_ptq_ee)
from ks4_restricted.dbo.KS4_pupil_18_amended_v2
where ks2emfg_grp>0
group by ks2emfg_grp
order by ks2emfg_grp

select ks2emfg_grp,
round(avg(cast(ebacfill as decimal)),2) as avgebacfill,
round(avg(cast(openfill as decimal)),2) as avgopenfill
from ks4_restricted.dbo.KS4_pupil_18_amended_v2
where inp8mod=1
group by ks2emfg_grp
order by ks2emfg_grp




