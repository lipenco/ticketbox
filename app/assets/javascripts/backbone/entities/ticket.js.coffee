@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Picture extends App.Entities.Model

    initialize: (@ticket_id, @picture_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures/#{@picture_id or ""}"


  class Entities.PictureCollection  extends App.Entities.Collection

    model: Entities.Picture
    initialize: (@id) ->

    url: -> "/tickets/#{@id}/pictures"

  class Entities.Ticket extends App.Entities.Model

    initialize: (@cat_id, @ticket_id) ->
    url: -> "/categories/#{@cat_id}/tickets/#{@ticket_id or ""}"

    relations : [
          type: Backbone.Many,
          key : 'pictures',
          relatedModel : Entities.Picture
          ]

  class Entities.TicketCollection extends App.Entities.Collection
    model: Entities.Ticket

    initialize: (@cat_id) ->
    url: -> "/categories/#{@cat_id}/tickets"



  API =
    getTickets: ->
      tickets = new Entities.TicketCollection
      tickets.fetch
        reset: true
      tickets

    newTicket: (cat_id)->
      new Entities.Ticket(cat_id)


  App.reqres.setHandler "ticket:entities", ->
    API.getTickets()


  App.reqres.setHandler "new:ticket:entity",(cat_id) ->
    API.newTicket(cat_id)
