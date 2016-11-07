$(document).on "turbolinks:load", -> 
  $('#date_init, #date_final, #operation_release_date, .date').datepicker {
    todayBtn: true
    language: 'pt-BR'
    autoclose: true
  }, $('.date').mask('00/00/0000'), $('.xd').mask('0000000000')
  return

  $('input[name=user_type]').change (e) ->
    curr = e.target.value.toLowerCase()
    $('[id$=_fields]').hide()
    $('#'+ curr +'_fields').show()