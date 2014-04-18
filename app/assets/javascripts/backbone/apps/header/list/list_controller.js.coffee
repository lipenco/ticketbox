@TB.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listHeader: ->
      headerView = @getHeaderView()


          # App.vent.trigger "goto:homepage"

      App.headerRegion.show headerView


    getHeaderView: ->
      new List.Headers
