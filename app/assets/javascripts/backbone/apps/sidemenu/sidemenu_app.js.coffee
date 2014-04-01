@TB.module "SidemenuApp", (SidemenuApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  # class SidemenuApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #     "sidemenu": "show"

  API =
    show: ->
      App.vent.trigger "header:choose", "Profile"
      new SidemenuApp.Show.Controller



  SidemenuApp.on "start", ->
    API.show()


  # App.addInitializer ->
  #   new SidemenuApp.Router
  #     controller: API
