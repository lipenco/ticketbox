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



    panelRegion: ->
      panelView = @getPanelView()
      @show panelView, region: @layout.panelRegion
      # @layout.panelRegion.show panelView



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
