@TB.module "TicketApp", (TicketApp, App, Backbone, Marionette, $, _) ->


  class TicketApp.Router extends Marionette.AppRouter
    appRoutes:
      "tickets": "list"



  API =
    list: ->
      new TicketApp.List.Controller




  App.addInitializer ->
    new TicketApp.Router
      controller: API
