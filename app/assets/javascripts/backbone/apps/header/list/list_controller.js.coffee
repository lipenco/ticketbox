@TB.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listHeader: ->
      currentUser = App.request "get:current:user"
      currentUserName = currentUser.get("name")
      links = App.request "header:entities", (currentUserName)

      headerView = @getHeaderView links

      # @listenTo headerView, "nav:open:sidemenu", ->
      #   snapper.expand('left')

      App.headerRegion.show headerView


    getHeaderView: (links, currentUserName) ->
      new List.Headers
        collection: links
