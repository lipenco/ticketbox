@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      {ticket} = options
      ticket_id = ticket.id
      App.mainRegion.close()
      pictures = App.request "new:picture:entities", ticket_id

      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @pictureRegion(ticket, pictures)
        @takenPicturesRegion(pictures)

      @listenTo @layout, "stop:recording", =>
        category_id  = ticket.cat_id
        console.log category_id
        video.pause()
        stream.stop()
        App.photoRegion.close()
        App.vent.trigger "category:show:ticketstaken", category_id

      App.photoRegion.show @layout


    takenPicturesRegion: (pictures) ->
      takenView = @getTakenPicturesRegion(pictures)

      # @listenTo takenView, "childview:edit:picture:clicked", (child, args) ->
      #   picture = child.model

      @listenTo takenView, "childview:save:picture:clicked", (child, args) ->
        picture = child.model
        window.pp = picture
        file = picture.get("file")
        Recorder.upload "/tickets/#{picture.ticket_id}/pictures",
          name: "sofish"
          file: file
        , (data) ->
          console.log data
          return

      # @listenTo takenView, "childview:delete:picture:clicked", (child, args) ->




      @show takenView, region: @layout.takenPicturesRegion


    editPictureRegion: (picture) ->
      editPictureView = @getEditPictureView(picture)
      @show editPictureView, region: @layout.pictureRegion


    pictureRegion:(ticket, pictures) ->
      pictureView = @getPictureRegion(ticket, pictures)

      # Recorder.play video, "both", ->

      # @listenTo pictureView, "play:video", =>
      #   video.className = "videoo"
      #   Recorder.play video, "both", ->

      @listenTo pictureView, "take:snapshot", =>
        window.tic = ticket
        ticket_id = ticket.id

        imgSource = Recorder.snapshot(video)
        picture = App.request "new:picture:entity", ticket_id
        picture.set({src: imgSource})
        picture.set({file: imgSource})
        pictures.add(picture)

      # @listenTo pictureView, "stop:recording", =>
      #   video.pause()
      #   stream.stop()
      #   App.photoRegion.close()

      @show pictureView, region: @layout.pictureRegion


    getTakenPicturesRegion: (pictures) ->
      new New.TakenPictures
        collection: pictures

    getEditPictureView: (picture) ->
      new New.EditPicture
        model: picture


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
