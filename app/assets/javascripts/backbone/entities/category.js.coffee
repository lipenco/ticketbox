@TB.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Picture extends App.Entities.Model

    initialize: (@ticket_id, @picture_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures/#{@picture_id or ""}"


  class Entities.PictureCollection  extends App.Entities.Collection

    model: Entities.Picture
    initialize: (@ticket_id) ->

    url: -> "/tickets/#{@ticket_id}/pictures"

  class Entities.Ticket extends App.Entities.Model

    initialize: (@cat_id, @ticket_id) ->
    url: -> "/categories/#{@cat_id}/tickets/#{@ticket_id or ""}"

    relations : [
          type: Backbone.Many,
          key : 'pictures',
          relatedModel : Entities.Picture
          ]

  class Entities.TicketCollection extends App.Entities.Collection
    model: Entities.Ticket

    initialize: (@cat_id) ->
    url: -> "/categories/#{@cat_id}/tickets"



  class Entities.UsersTicketCollection extends App.Entities.Collection
    model: Entities.Ticket
    url: -> "/user_tickets"


  class Entities.Category extends App.Entities.Model
    initialize: (@id) ->

    url: -> "/categories/#{@id}"

    relations : [
          type: Backbone.Many,
          key : 'tickets',
          relatedModel : Entities.Ticket
          ]


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
