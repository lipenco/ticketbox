@TB.module "PictureApp", (PictureApp, App, Backbone, Marionette, $, _) ->


  # class PictureApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #     "tickets": "list"

  API =
    newPicture: (region, ticket) ->
      new PictureApp.New.Controller
        region: region
        model: ticket



  App.commands.setHandler "add:picture:new", (region, ticket) ->
    API.newPicture region, ticket
