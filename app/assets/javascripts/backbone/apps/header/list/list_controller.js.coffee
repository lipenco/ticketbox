@TB.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listHeader: ->

      headerView = @getHeaderView()

      # @listenTo headerView, "nav:open:sidemenu", ->
      #   snapper.expand('left')

      App.headerRegion.show headerView


    getHeaderView: ->
      new List.Headers
