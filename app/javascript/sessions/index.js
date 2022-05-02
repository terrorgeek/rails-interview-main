$(function () { 
  $("#login-form").validate({
    rules: {
      "login[email]": "required",
      "login[password]": "required",
    }
  })


    // var elem = document.querySelector('#login-form');
    // var animation = elem.animate({
    //     opacity: [0.5, 1],
    //     transform: ['scale(0.5)', 'scale(1)'],
    // }, {
    //     direction: 'alternate',
    //     duration: 500,
    //     iterations: Infinity,
    // });
})