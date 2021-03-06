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

    previewTicket: (region, ticket, pictures) ->
      new TicketApp.Prev.Controller
        region: region
        ticket: ticket
        pictures: pictures

    showTicketsForCategory: (id, category) ->
      new TicketApp.ShowByCat.Controller
        id: id
        category: category

    showTicketsTaken: (category_id) ->
      new TicketApp.ShowByCat.Controller
        id: category_id



  App.vent.on "goto:home:page",  ->
    API.list()
    App.navigate Routes.tickets_path()

  App.vent.on "new:ticket:create", (region, category) ->
    API.newTicket region, category

  App.vent.on "category:show:tickets", (category) ->
    id = category.id
    App.navigate Routes.category_tickets_path(category.id)
    API.showTicketsForCategory id, category

  App.vent.on "category:show:ticketstaken", (category_id) ->
    App.navigate Routes.category_tickets_path(category_id)
    API.showTicketsTaken category_id

  App.vent.on "preview:ticket:show", (region, ticket, pictures) ->
    API.previewTicket region, ticket, pictures










  App.addInitializer ->
    new TicketApp.Router
      controller: API
