//Check required field
function checkForm(formName){
    let check=true
    $($('#'+formName).prop('elements')).each(function(){
        if (($(this).prop("required"))&&($(this).val()=="")){
          check=false
          $(this).addClass("border-danger")
        }
        else if (($(this).prop("required"))&&($(this).val()!="")){
          $(this).removeClass("border-danger").addClass("border-success")
        }
        else{
          $(this).removeClass("border-danger")
        }
    });
    return check
  }
// Reset form
function resetForm(formName){
  $("#"+formName).get(0).reset()
  $($('#'+formName).prop('elements')).each(function(){
    $(this).removeClass("border-danger")
    $(this).removeClass("border-success")
  })
}

  