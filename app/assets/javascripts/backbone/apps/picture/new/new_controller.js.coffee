@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      {ticket} = options
      ticket_id = ticket.id
      pictures = App.request "new:picture:entities", ticket_id

      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @pictureRegion(ticket, pictures)
        @takenPicturesRegion(pictures)

      App.photoRegion.show @layout


    takenPicturesRegion: (pictures) ->
      takenView = @getTakenPicturesRegion(pictures)
      @show takenView, region: @layout.takenPicturesRegion


    pictureRegion:(ticket, pictures) ->
      pictureView = @getPictureRegion(ticket, pictures)
      # Recorder.play video, "both", ->

      # @listenTo pictureView, "play:video", =>
      #   video.className = "videoo"
      #   Recorder.play video, "both", ->

      @listenTo pictureView, "take:snapshot", =>
        ticket_id = ticket.id

        imgSource = Recorder.snapshot(video)
        # img = document.createElement("img")
        # img.src = imgSource
        # img.className = "new-image"
        # pictureView.$el.append img
        picture = App.request "new:picture:entity", ticket_id
        picture.set({src: imgSource})
        picture.set({file: imgSource})
        pictures.add(picture)

        Recorder.upload "/tickets/#{ticket.id}/pictures",
          name: "sofish"
          file: imgSource
        , (data) ->
          console.log data
          return

      @listenTo pictureView, "stop:recording", =>
        video.pause()
        stream.stop()
        App.photoRegion.close()

      @show pictureView, region: @layout.pictureRegion


    getTakenPicturesRegion: (pictures) ->
      new New.TakenPictures
        collection: pictures


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
