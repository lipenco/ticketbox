@TB.module "CategoryApp.UserList", (UserList, App, Backbone, Marionette, $, _) ->

  class UserList.Controller extends App.Controllers.Application

    initialize: ->
      categories = App.request "category:entities"

      @layout = @getLayoutView categories

      @listenTo @layout, "show", =>
        @categoriesRegion(categories)

      @show @layout, loading: true

    categoriesRegion: (categories) ->
      categoriesView = @getCategoriesView categories
      @listenTo categoriesView, "childview:category:flip", ->
        console.log "flip"
        $(".opening").toggleClass("flip");
      #   category = args.model
      #   @newRegion(category)
        # App.vent.trigger "new:ticket:create"

      @show categoriesView, region: @layout.categoriesRegion

    # newRegion:(category)->
    #   App.vent.trigger "new:ticket:create", @layout.newTicketRegion, category
    #
    #
    #
    getCategoriesView: (categories) ->
      new UserList.Categories
        collection: categories
    #
    #
    # getLayoutView: (categories) ->
    #   new List.Layout
    #     collection: categories

    getLayoutView: (categories) ->
      new UserList.Layout
        collection: categories
