# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @BudgetsController
  index: () ->
    $('#new_budget').on 'ajax:success', (ev, data, status, xhr) ->
      $('#goal_table').removeClass 'hidden'
      if $('#btn_exist_continue').length == 0
        $('#btn_continue').removeClass 'hidden'
      $('#add_goal_modal').modal 'hide'
      $('#goal_table_body').append $("<tr><td>#{data.name}</td><td>#{number_to_currency(data.balance)}</td><td>#{number_to_currency(data.goal)}</td></tr>")
      this.reset()
