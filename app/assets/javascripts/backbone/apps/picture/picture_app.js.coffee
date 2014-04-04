@TB.module "PictureApp", (PictureApp, App, Backbone, Marionette, $, _) ->


  # class PictureApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #     "tickets": "list"

  API =
    newPicture: (ticket) ->
      new PictureApp.New.Controller
        ticket: ticket



  App.commands.setHandler "add:picture:new", (ticket) ->
    API.newPicture ticket
