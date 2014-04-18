@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options) ->
      {ticket} = options
      ticket_id = ticket.id
      App.mainRegion.close()
      pictures = new Backbone.Collection([])
      window.coll = pictures

      @layout = @getLayoutView ticket

      @listenTo @layout, "show", =>
        @pictureRegion(ticket, pictures)
        @takenPicturesRegion(pictures)
        @ticketPrevRegion(ticket)

      @listenTo @layout, "stop:recording", =>
        category_id  = ticket.cat_id
        video.pause()
        stream.stop() if window.stream
        App.photoRegion.close()
        App.vent.trigger "category:show:ticketstaken", category_id

      App.photoRegion.show @layout


    ticketPrevRegion: (ticket) ->
      App.vent.trigger "preview:ticket:show", @layout.ticketPrevRegion, ticket


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

      @listenTo pictureView, "take:snapshot", =>
        window.tic = ticket
        ticket_id = ticket.id

        imgSource = Recorder.snapshot(video)
        picture = App.request "new:picture:entity", ticket_id
        picture.set({src: imgSource})
        picture.set({file: imgSource})
        pictures.add(picture)

      @show pictureView, region: @layout.pictureRegion


    getTakenPicturesRegion: (pictures) ->
      new New.TakenPictures
        collection: pictures

    getEditPictureView: (picture) ->
      new New.EditPicture
        model: picture

    getPrevRegion: (ticket) ->
      new New.TicketPrev
        model: ticket


    getPictureRegion: (ticket) ->
      new New.Picture
        model: ticket

    getLayoutView: (ticket) ->
      new New.Layout
        model: ticket
