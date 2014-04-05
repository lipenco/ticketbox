@TB.module "TicketApp", (TicketApp, App, Backbone, Marionette, $, _) ->


  class TicketApp.Router extends Marionette.AppRouter
    appRoutes:
      "tickets": "list"



  API =
    list: ->
      new TicketApp.List.Controller

    newTicket: (region, category) ->
      new TicketApp.New.Controller
        region: region
        category: category

    showTicketsForCategory: (category) ->
      new TicketApp.ShowByCat.Controller
        category: category


  # App.commands.setHandler "new:ticket:create", (region) ->
  #   API.newTicket region

  App.vent.on "new:ticket:create", (region, category) ->
    API.newTicket region, category

  App.vent.on "category:show:tickets", (category) ->
    App.navigate Routes.category_tickets_path(category.id)
    API.showTicketsForCategory category






  App.addInitializer ->
    new TicketApp.Router
      controller: API
