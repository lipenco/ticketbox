@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Layout extends App.Views.Layout
    template: "picture/new/new_layout"

    regions:
      pictureRegion:	"#picture-region"
      takenPicturesRegion: "#taken-pictures-region"



  class New.TakenPicture extends App.Views.ItemView
    template: "picture/new/_takenpicture"
    tagName: "li"
    className: "col-md-3"

    events:
      "mouseover .takenpicture" : "showIcons"
      "mouseleave .takenpicture" : "showHide"

    showIcons: (e) =>
      window.we = @
      @.$el.children(".icons-hover").addClass("visible")

    showHide: (e) =>
      @.$el.children(".icons-hover").removeClass("visible")


      # e.target[0].find(".icons-hover").css("display:block")

    triggers:
      "click .takenpicture" : "edit:picture:clicked"

  class New.Empty extends App.Views.ItemView
    template: "picture/new/_empty"
    tagName:  "li"



  class New.TakenPictures extends App.Views.CompositeView
    template: "picture/new/_takenpictures"
    itemView: New.TakenPicture
    emptyView: New.Empty
    itemViewContainer: "ul"


  class New.EditPicture extends App.Views.ItemView
    template: "picture/new/_edit"

    # onShow:->
    #   @editPicture()
    #
    # editPicture: ->
    #   @$el.find('img').cropper
    #     file: $('img').src
    #     bgColor: '#fff'
    #     maxSize: [320, 240]
    #     minSize: [100, 100]
    #     aspectRatio: 1
    #     onSelect: (coords) ->
    #       @$el.find('img').fileapi('crop', imageFile, coords);




  class New.Picture extends App.Views.ItemView
    template: "picture/new/_picture"

    triggers:
      # "click #play" :     "play:video"
      "click #snapshot" : "take:snapshot"
      "click #video" :    "take:snapshot"
      "click #stop"  :    "stop:recording"

    onShow:->
      @playVideo()

    playVideo: ->
      # window.elll = @$el.find("#video")
      @$el.find("#video").addClass("videoo")
      Recorder.play video, "both", ->
