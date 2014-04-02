@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Picture extends App.Entities.Model

    initialize: (@ticket_id, @picture_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures/#{@picture_id or ""}"


  class Entities.PictureCollection  extends App.Entities.Collection

    model: Entities.Picture
    initialize: (@id) ->

    url: -> "/tickets/#{@id}/pictures"

  class Entities.Ticket extends App.Entities.Model
    url: -> Routes.tickets_path()

    relations : [
          type: Backbone.Many,
          key : 'pictures',
          relatedModel : Entities.Picture
          ]

  class Entities.TicketCollection extends App.Entities.Collection
    model: Entities.Ticket
    url: -> Routes.tickets_path()



  API =
    getTickets: ->
      tickets = new Entities.TicketCollection
      tickets.fetch
        reset: true
      tickets

    newTicket: ->
      new Entities.Ticket


  App.reqres.setHandler "ticket:entities", ->
    API.getTickets()


  App.reqres.setHandler "new:ticket:entity", ->
    API.newTicket()
