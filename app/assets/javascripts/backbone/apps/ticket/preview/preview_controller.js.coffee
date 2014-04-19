@TB.module "TicketApp.Prev", (Prev, App, Backbone, Marionette, $, _) ->

  class Prev.Controller extends App.Controllers.Application

    initialize: (options)->
      {ticket, pictures} = options



      @layout = @getLayoutView ticket, pictures

      @listenTo @layout, "picture:delete", (picture) =>
        console.log "here"

      @listenTo @layout, "show", =>
        @nameRegion(ticket)
        @descriptionRegion(ticket)
        @picturesRegion(ticket, pictures)

      @show @layout, loading: true

    nameRegion: (ticket) ->
      nameView = @getNameView ticket
      @show nameView, region: @layout.nameRegion

    picturesRegion: (ticket, pictures) ->
      picturesView = @getPicturesView ticket, pictures

      @listenTo picturesView, "picture:delete:clicked", =>
        console.log "here"

      # @listenTo picturesView, "picture:delete:clicked", (picture) =>
      #   console.log "here"

      @show picturesView, region: @layout.picturesRegion


    descriptionRegion: (ticket) ->
      descView = @getDescView ticket

      @listenTo descView, "picture:save", (ticket) =>
        text = $("input").val()
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

    getPicturesView: (ticket, pictures) ->
      window.pp = pictures
      new Prev.Pictures
        model: ticket
        collection: pictures



    getNameView: (ticket) ->
      new Prev.Name
        model: ticket


    getLayoutView: (ticket, pictures) ->
      window.we = ticket
      new Prev.Layout
        model: ticket
        collection: pictures
