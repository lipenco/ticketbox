@TB.module "TicketApp.ShowByCat", (ShowByCat, App, Backbone, Marionette, $, _) ->

  class ShowByCat.Controller extends App.Controllers.Application

    initialize: (options) ->
      {category, id} = options
      currentUser = App.request "get:current:user"
      currentUserId = currentUser.get("id")
      if currentUserId
        id = category.get("id") if category
        tickets = App.request "ticket:entities", id
        category or= App.request "category:entity", id

        @layout = @getLayoutView tickets, category

        @listenTo @layout, "show", =>
          @ticketRegion(tickets)
          @titleRegion(category)

        @show @layout, loading: true
      else
        App.vent.trigger "landing:page:show"

    ticketRegion: (tickets) ->
      ticketsView = @getTicketsView tickets
      # @listenTo categoriesView, "childview:category:chosen:new", (child, args) =>
      #   category = args.model
      #   @newRegion(category)
        # App.vent.trigger "new:ticket:create"

      @show ticketsView, region: @layout.ticketsRegion

    titleRegion: (category) ->
      titleView = @getTitleView category
      @show titleView, region: @layout.titleRegion

    getTitleView: (category) ->
      new ShowByCat.Title
        model: category

    getTicketsView: (tickets) ->
      new ShowByCat.Tickets
        collection: tickets


    getLayoutView: (tickets, category) ->
      new ShowByCat.Layout
        collection: tickets
        model: category
