@TB.module "LandingApp", (LandingApp, App, Backbone, Marionette, $, _) ->

  API =
    show: ->
      new LandingApp.Show.Controller


  App.vent.on "landing:page:show", ->
    API.show()

  #
  #
  # App.addInitializer ->
  #   new TicketApp.Router
  #     controller: API
