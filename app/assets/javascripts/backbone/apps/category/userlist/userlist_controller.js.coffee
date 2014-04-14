@TB.module "CategoryApp.UserList", (UserList, App, Backbone, Marionette, $, _) ->

  class UserList.Controller extends App.Controllers.Application

    initialize: ->
      categories = App.request "category:popular:entities"

      @layout = @getLayoutView categories

      @listenTo @layout, "show", =>
        @categoriesRegion(categories)

      @show @layout, loading: true

    categoriesRegion: (categories) ->
      categoriesView = @getCategoriesView categories

      @listenTo categoriesView, "childview:category:show:tickets", (child, args) ->
        category = child.model
        App.vent.trigger "category:show:tickets", category

      @listenTo categoriesView, "category:show:all", (el)->
        categories = App.request "category:entities"
        @categoriesRegion(categories)

      @show categoriesView, region: @layout.categoriesRegion




    getCategoriesView: (categories) ->
      new UserList.Categories
        collection: categories




    getLayoutView: (categories) ->
      new UserList.Layout
        collection: categories
