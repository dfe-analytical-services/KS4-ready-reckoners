function getCookies(){
  var res = Cookies.get();
  Shiny.setInputValue('cookies', res);
}

Shiny.addCustomMessageHandler('cookie-set', function(msg){
  Cookies.set(msg.name, msg.value, { expires: 96 });
  getCookies();
})

Shiny.addCustomMessageHandler('cookie-remove', function(msg){
  Cookies.remove(msg.name);
  getCookies();
})

$(document).on('shiny:connected', function(){
  getCookies();
})

Shiny.addCustomMessageHandler('analytics-consent', function(msg){
  gtag('consent', 'update', {
    'analytics_storage': msg.value
  });
})


