# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", -> 
  $('.simple-test').select2()
  $('#valor').maskMoney
    decimal: '.'
    thousands: ''
  $('#operation_release_date').mask '00/00/0000'
  return