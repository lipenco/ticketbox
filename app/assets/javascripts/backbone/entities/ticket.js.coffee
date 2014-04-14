@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Picture extends App.Entities.Model

    initialize: (@ticket_id, @picture_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures/#{@picture_id or ""}"


  class Entities.PictureCollection  extends App.Entities.Collection

    model: Entities.Picture
    initialize: (@ticket_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures"

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



  class Entities.UsersTicketCollection extends App.Entities.Collection
    model: Entities.Ticket
    url: -> "/user_tickets"



  API =
    getTickets:(cat_id) ->
      tickets = new Entities.TicketCollection(cat_id)
      tickets.fetch
        reset: true
      tickets

    getUserTickets: ->
      tickets = new Entities.UsersTicketCollection
      tickets.fetch
        reset: true
      tickets

    newTicket: (cat_id)->
      new Entities.Ticket(cat_id)

    newPicture: (ticket_id)->
      new Entities.Picture(ticket_id)

    newPictures: (ticket_id)->
      new Entities.PictureCollection(ticket_id)


  App.reqres.setHandler "ticket:entities", (category_id) ->
    cat_id = category_id
    API.getTickets(cat_id)

  App.reqres.setHandler "new:picture:entity",(ticket_id) ->
    API.newPicture(ticket_id)

  App.reqres.setHandler "new:picture:entities",(ticket_id) ->
    API.newPictures(ticket_id)

  App.reqres.setHandler "new:ticket:entity",(cat_id) ->
    API.newTicket(cat_id)

  App.reqres.setHandler "ticket:user:entities", ->
    API.getUserTickets
