@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Ticket extends App.Entities.Model
    url: -> Routes.tickets_path()

  class Entities.TicketCollection extends App.Entities.Collection
    model: Entities.Ticket
    url: -> Routes.tickets_path()



  API =
    getTickets: ->
      tickets = new Entities.TicketCollection
      tickets.fetch
        reset: true
      tickets

  App.reqres.setHandler "ticket:entities", ->
    API.getTickets()
