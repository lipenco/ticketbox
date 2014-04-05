@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Category extends App.Entities.Model
    initialize: (@id) ->

    url: -> "/categories/#{@id}"


  class Entities.CategoryCollection  extends App.Entities.Collection

    model: Entities.Category

    url: -> Routes.categories_path()

  class Entities.PopularCategoryCollection  extends App.Entities.Collection

    model: Entities.Category

    url: -> "/popular_categories"



  API =
    getCategory: (id) ->
      category = new Entities.Category(id)
      category.fetch()
      category


    getCategories: ->
      categories = new Entities.CategoryCollection
      categories.fetch
        reset: true
      categories

    getPopularCategories: ->
      categories = new Entities.PopularCategoryCollection
      categories.fetch
        reset: true
      categories



  App.reqres.setHandler "category:entity", (id) ->
    API.getCategory(id)

  App.reqres.setHandler "category:entities", ->
    API.getCategories()

  App.reqres.setHandler "category:popular:entities", ->
    API.getPopularCategories()
