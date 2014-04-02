@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Ticket extends App.Views.ItemView
    template: "ticket/new/new_ticket"

    modelEvents:
      "created" : "render"

    form:
      buttons:
        placement: "left"
