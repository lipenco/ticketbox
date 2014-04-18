@TB.module "TicketApp.Prev", (Prev, App, Backbone, Marionette, $, _) ->

  class Prev.Controller extends App.Controllers.Application

    initialize: (options)->
      {ticket} = options

      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @nameRegion(ticket)
        @descriptionRegion(ticket)
        # @ticketRegion(ticket)
        # @picturesRegion(ticket)

      @show @layout, loading: true

    nameRegion: (ticket) ->
      nameView = @getNameView ticket
      @show nameView, region: @layout.nameRegion

    descriptionRegion: (ticket) ->
      descView = @getDescView ticket

      @listenTo descView, "description:save", (ticket) =>
        text = $(".edit-document").html()
        ticket.set({description: text})
        window.tt = ticket
        category_id = ticket.cat_id
        ticket_id = ticket.id
        ticket.url = "/categories/#{category_id}/tickets/#{ticket_id}"
        ticket.save()

      @show descView, region: @layout.descriptionRegion


    getDescView: (ticket) ->
      new Prev.Description
        model: ticket



    getNameView: (ticket) ->
      new Prev.Name
        model: ticket


    getLayoutView: (ticket) ->
      new Prev.Layout
        model: ticket
