# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @BudgetsController
  index: () ->
    $('#new_budget').on 'ajax:success', (ev, data, status, xhr) ->
      console.dir data
      this.reset()
      $('#addGoalModal').modal 'hide'