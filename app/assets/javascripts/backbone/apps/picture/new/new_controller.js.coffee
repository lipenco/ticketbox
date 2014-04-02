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

      @listenTo pictureView, "play:video", =>
        Recorder.play video, "both", ->
          snapshot.style.display = "inline"
          return

      @listenTo pictureView, "take:snapshot", =>
        imgSource = Recorder.snapshot(video)
        # img = document.createElement("img")
        # img.src = imgSource
        # $('#imgs').appendChild img
        Recorder.upload "/test/image.php",
          name: "sofish"
          file: imgSource
        , (data) ->
          console.log data
          return



      @show pictureView, region: @layout.pictureRegion


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
