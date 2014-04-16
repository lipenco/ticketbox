@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Ticket extends App.Views.ItemView
    template: "ticket/new/new_ticket"

    modelEvents:
      "created" : "render"

    form:
      buttons:
        placement: "left"

    onRender: ->
       @addDayPicker()

    addDayPicker: ->
      @$el.find('#dp1').datepicker()
      d = new Date()
      curr_date = d.getDate()
      curr_month = d.getMonth() + 1
      curr_year = d.getFullYear()
      @$el.find('#dp1').val(curr_date + "-" + curr_month + "-" + curr_year)
