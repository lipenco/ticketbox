@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      {ticket} = options

      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @pictureRegion(ticket)

      @show @layout, loading: true


    pictureRegion:(ticket) ->
      pictureView = @getPictureRegion(ticket)

      # @listenTo panelView, "new:ticket:button:clicked", =>
      #   @newRegion()

      @show pictureView, region: @layout.pictureRegion


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
