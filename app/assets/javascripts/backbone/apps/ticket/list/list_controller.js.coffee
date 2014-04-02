@TB.module "TicketApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      tickets = App.request "ticket:entities"

      @layout = @getLayoutView tickets

      @listenTo @layout, "close", @close

      @listenTo @layout, "show", =>
        @panelRegion()
        @ticketsRegion tickets

      @show @layout, loading: true



    panelRegion: (ticket) ->
      panelView = @getPanelView()

      @listenTo panelView, "new:ticket:button:clicked", =>
        @newRegion()
        @pictureRegion(ticket)

      @show panelView, region: @layout.panelRegion
      # @layout.panelRegion.show panelView


    newRegion: ->
      App.execute "new:ticket:create", @layout.newRegion

    pictureRegion: (ticket)->
      App.execute "add:picture:new", @layout.pictureRegion, ticket




    ticketsRegion: (tickets) ->
      window.w = tickets
      ticketView = @getTicketsView tickets
      # @layout.conferenceRegion.show conferenceView
      @show ticketView, region: @layout.ticketsRegion


    getTicketsView: (tickets) ->
      new List.Tickets
        collection: tickets

    getPanelView: ->
      new List.Panel



    getLayoutView: (tickets) ->
      new List.Layout
        collection: tickets
