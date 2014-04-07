# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @ContributionProfilesController
  index: () ->
    $('#new_contribution_profile').on 'ajax:success', (ev, data, status, xhr) ->
      $('#btn_save_profile').addClass 'hidden'
      $('#btn_continue').removeClass 'hidden'
