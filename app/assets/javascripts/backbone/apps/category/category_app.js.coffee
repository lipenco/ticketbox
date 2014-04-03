@TB.module "CategoryApp", (CategoryApp, App, Backbone, Marionette, $, _) ->


  API =
    list: (region) ->
      new CategoryApp.List.Controller
        region: region



  App.commands.setHandler "list:categories", (region) ->
    API.list region
