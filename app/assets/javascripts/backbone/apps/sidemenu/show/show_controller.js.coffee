@TB.module "SidemenuApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: ->
      currentUser = App.request "get:current:user"


      @layout = @getLayoutView currentUser

      @listenTo @layout, "show", =>
        @nameRegion currentUser
        @loginRegion() if currentUserId is undefined

      App.sidebarRegion.show @layout



    loginRegion: ->
      loginView = @getLoginView()
      @layout.loginRegion.show loginView


    nameRegion: (currentUser) ->
      nameView = @getNameView currentUser
      @layout.nameRegion.show nameView

    getLoginView: ->
      new Show.Login

    getNameView: (currentUser)  ->
      new Show.Name
        model: currentUser

    getLayoutView: ->
      new Show.Layout
