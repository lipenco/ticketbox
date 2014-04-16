@TB.module "LandingApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      App.headerRegion.close()
      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @landingRegion()

      @show @layout, loading: true


    landingRegion: ->
      landingView = @getLandingView()
      @listenTo landingView, "open:menu:clicked", ->
        snapper.open('left')

      @layout.landingRegion.show landingView


    getLandingView: ->
      new Show.Landing


    getLayoutView: ->
      new Show.Layout
