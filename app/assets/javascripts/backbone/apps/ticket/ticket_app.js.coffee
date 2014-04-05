@TB.module "TicketApp", (TicketApp, App, Backbone, Marionette, $, _) ->


  class TicketApp.Router extends Marionette.AppRouter
    appRoutes:
      "tickets": "list"
      "categories/:id/tickets" : "showTicketsForCategory"



  API =
    list: ->
      new TicketApp.List.Controller

    newTicket: (region, category) ->
      new TicketApp.New.Controller
        region: region
        category: category

    showTicketsForCategory: (id, category) ->
      new TicketApp.ShowByCat.Controller
        id: id
        category: category


  # App.commands.setHandler "new:ticket:create", (region) ->
  #   API.newTicket region

  App.vent.on "new:ticket:create", (region, category) ->
    API.newTicket region, category

  App.vent.on "category:show:tickets", (category) ->
    App.navigate Routes.category_tickets_path(category.id)
    API.showTicketsForCategory category.id, category






  App.addInitializer ->
    new TicketApp.Router
      controller: API
