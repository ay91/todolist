
function setCompleteTaskListener(){
  $(".task_checkbox").change(function(){
      $.ajax({
         url: '/complete',
         type: 'POST',
         data: {"completed": this.checked, "id": $(this).attr("value")}
       }).done(function(response) {
         if (this.checked){
           $(".task-text[data-id="+$(this).attr("value")+"]").addClass("strike");
         }
         else {
           $(".task-text[data-id="+$(this).attr("value")+"]").removeClass("strike");
         }
      }.bind(this)).fail(function(response){
      });
  });
};

$(document).on("turbolinks:load", setCompleteTaskListener);
