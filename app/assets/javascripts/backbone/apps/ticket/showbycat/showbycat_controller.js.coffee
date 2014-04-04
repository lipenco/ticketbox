@TB.module "TicketApp.ShowByCat", (ShowByCat, App, Backbone, Marionette, $, _) ->

  class ShowByCat.Controller extends App.Controllers.Application

    initialize: (options) ->
      { category_id } = options
      tickets = App.request "ticket:entities", category_id
      console.log tickets

      # @layout = @getLayoutView categories
      #
      # @listenTo @layout, "show", =>
      #   @categoriesRegion(categories)
      #
      # @show @layout, loading: true

    # categoriesRegion: (categories) ->
    #   categoriesView = @getCategoriesView categories
    #   @listenTo categoriesView, "childview:category:chosen:new", (child, args) =>
    #     category = args.model
    #     @newRegion(category)
    #     # App.vent.trigger "new:ticket:create"
    #
    #   @show categoriesView, region: @layout.categoriesRegion
    #
    # newRegion:(category)->
    #   App.vent.trigger "new:ticket:create", @layout.newTicketRegion, category
    #
    #
    #
    # getCategoriesView: (categories) ->
    #   new List.Categories
    #     collection: categories
    #
    #
    # getLayoutView: (categories) ->
    #   new List.Layout
    #     collection: categories
