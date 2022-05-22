function sleep(msec) {
   return new Promise(function(resolve) {

      setTimeout(function() {resolve()}, msec);

   })
};

$(document).ready(function (){
  $('#flash-message').slideDown(1000,async function start(){
    await sleep(2000);
    $('#flash-message').slideUp(1000);
  });
});