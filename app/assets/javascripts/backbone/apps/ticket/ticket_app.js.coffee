@TB.module "TicketApp", (TicketApp, App, Backbone, Marionette, $, _) ->


  class TicketApp.Router extends Marionette.AppRouter
    appRoutes:
      "tickets": "list"



  API =
    list: ->
      new TicketApp.List.Controller

    newTicket: (region) ->
      new TicketApp.New.Controller
        region: region



  App.commands.setHandler "new:ticket:create", (region) ->
    API.newTicket region




  App.addInitializer ->
    new TicketApp.Router
      controller: API
