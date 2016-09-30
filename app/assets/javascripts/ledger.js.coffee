
$(document).on 'ready page:load', ->
	$('#date_init, #date_final').datepicker 
  todayBtn: true
  language: 'pt-BR'
  autoclose: true
  $('.date').mask '00/00/0000'
  $('.xd').mask '0000000000'
	return
