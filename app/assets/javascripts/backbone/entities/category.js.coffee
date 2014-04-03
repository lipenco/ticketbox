@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Category extends App.Entities.Model

    url: -> Routes.categories_path()


  class Entities.CategoryCollection  extends App.Entities.Collection

    model: Entities.Category

    url: -> Routes.categories_path()

  API =
    getCategories: ->
      categories = new Entities.CategoryCollection
      categories.fetch
        reset: true
      categories


  App.reqres.setHandler "category:entities", ->
    API.getCategories()
