@TB.module "CategoryApp", (CategoryApp, App, Backbone, Marionette, $, _) ->

  # class CategoryApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #     "tickets": "list"


  API =
    list: (region) ->
      new CategoryApp.List.Controller
        region: region

    userList: (region)->
      new CategoryApp.UserList.Controller
        region: region



  App.commands.setHandler "list:categories", (region) ->
    API.list region


  App.commands.setHandler "list:user:categories", (region) ->
    API.userList region



  # App.addInitializer ->
  #   new CategoryApp.Router
  #     controller: API
