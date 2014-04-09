# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class @SavingsTransactionsController
  index: () ->
    updateContributions = () ->
      $this = $('#amount_text')
      try
        value = new Number($this.val())
      catch error
        console.log error
        
      if isNaN(value)
        console.log "You must enter a number"
      else
        $(".budget-row").each (index) ->
          # extract the rate for each budget
          rate = $(this).children('.budget-rate').first().text()

          # parse the % off the end and convert to a Number
          rate = new Number(rate.substr(0, rate.length-1))
          
          # calculate the amount
          amount = value * (rate/100)
          
          $(this).children('.budget-contribution-amount').first().text("$#{amount.toFixed(2).toString()}")
          #$(this).children('.budget-contribution-amount').children('.hidden_amount').val(amount)
          
      
    $('#amount_text').on 'keypress', (ev) ->
      $this = $(this)
      if $this.timeoutId
        clearTimeout(this.timeoutId)
      this.timeoutId = setTimeout(updateContributions, 500)