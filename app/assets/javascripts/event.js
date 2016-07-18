$(document).ready(function(){
  $("#event_form").validate({
    rules: {
     "event[title]": {
      required: true
    },

    "event[description]": {
      required: "Please specify description"
    }

  },

  errorElement: "span",
  errorClass: "help-block",
  messages: {

    "event[title]": {
      required: "Please specify Title"
    },
    "event[description]": {
      required: "Please specify description"
    }

  },

  highlight: function(element) {
   $(element).parent().addClass("has-error");
 },
 unhighlight: function(element) {
   $(element).parent().removeClass("has-error");
 }

});
});

