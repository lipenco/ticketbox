@TB.module "CategoryApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      categories = App.request "category:entities"

      @layout = @getLayoutView categories

      @listenTo @layout, "show", =>
        @categoriesRegion(categories)

      @show @layout, loading: true

    categoriesRegion: (categories) ->
      categoriesView = @getCategoriesView categories
      # @layout.conferenceRegion.show conferenceView
      @show categoriesView, region: @layout.categoriesRegion


    getCategoriesView: (categories) ->
      new List.Categories
        collection: categories


    getLayoutView: (categories) ->
      new List.Layout
        collection: categories
