# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", -> 
  $('.simple-test').select2()
  $('#valor').maskMoney
    decimal: '.'
    thousands: ''

  $('#date_init, #date_final, #operation_release_date, .date').datepicker {
    todayBtn: true
    language: 'pt-BR'
    format: 'dd/mm/yyyy' 
    autoclose: true
  }, $('.date').mask('00/00/0000'), $('.xd').mask('0000000000')
  return