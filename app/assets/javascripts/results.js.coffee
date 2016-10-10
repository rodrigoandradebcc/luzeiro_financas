# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
	$('#init').datepicker 
  todayBtn: true
  language: 'pt-BR'
  autoclose: true

	return
$(document).on 'ready page:load', ->
	$('#final').datepicker 
  todayBtn: true
  language: 'pt-BR'
  autoclose: true

	return