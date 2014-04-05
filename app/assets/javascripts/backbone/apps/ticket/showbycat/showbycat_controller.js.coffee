@TB.module "TicketApp.ShowByCat", (ShowByCat, App, Backbone, Marionette, $, _) ->

  class ShowByCat.Controller extends App.Controllers.Application

    initialize: (options) ->
      {category} = options
      category_id = category.id
      tickets = App.request "ticket:entities", category_id

      @layout = @getLayoutView tickets

      @listenTo @layout, "show", =>
        @ticketRegion(tickets)

      @show @layout, loading: true

    ticketRegion: (tickets) ->
      ticketsView = @getTicketsView tickets
      # @listenTo categoriesView, "childview:category:chosen:new", (child, args) =>
      #   category = args.model
      #   @newRegion(category)
        # App.vent.trigger "new:ticket:create"

      @show ticketsView, region: @layout.ticketsRegion
    #
    # newRegion:(category)->
    #   App.vent.trigger "new:ticket:create", @layout.newTicketRegion, category
    #
    #
    #
    getTicketsView: (tickets) ->
      new ShowByCat.Tickets
        collection: tickets


    getLayoutView: (tickets) ->
      new ShowByCat.Layout
        collection: tickets
