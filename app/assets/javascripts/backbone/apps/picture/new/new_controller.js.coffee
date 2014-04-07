@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      {ticket} = options
      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @pictureRegion(ticket)

      App.photoRegion.show @layout


    pictureRegion:(ticket) ->
      pictureView = @getPictureRegion(ticket)
      # Recorder.play video, "both", ->

      @listenTo pictureView, "play:video", =>
        Recorder.play video, "both", ->


      @listenTo pictureView, "take:snapshot", =>
        imgSource = Recorder.snapshot(video)
        img = document.createElement("img")
        img.src = imgSource
        img.className = "new-image"
        pictureView.$el.append img
        Recorder.upload "/tickets/#{ticket.id}/pictures",
          name: "sofish"
          file: imgSource
        , (data) ->
          console.log data
          return

      @listenTo pictureView, "stop:recording", =>
        # video.pause()
        # video.src=""
        # localMediaStream.stop()
        # mediaStream.stop()
        Recorder.stopWebCam()
        # video.pause();
        # localMediaStream.stop();
        # $('video').fadeOut(1000);



        # App.photoRegion.close()


      @show pictureView, region: @layout.pictureRegion


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
