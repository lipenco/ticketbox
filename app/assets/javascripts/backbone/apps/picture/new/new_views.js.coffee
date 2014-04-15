@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Layout extends App.Views.Layout
    template: "picture/new/new_layout"

    regions:
      pictureRegion:	"#picture-region"
      takenPicturesRegion: "#taken-pictures-region"

    triggers:
      "click #stop"  :    "stop:recording"



  class New.TakenPicture extends App.Views.ItemView
    template: "picture/new/_takenpicture"
    tagName: "li"
    className: "col-md-3"

    events:
      "mouseover .wrapper" : "showIcons"
      "mouseleave .wrapper" : "showHide"
      "click .pic-trash" :   "deletePicture"

    showIcons: (e) =>
      window.we = @
      @.$el.find(".icons-hover").addClass("visible")

    showHide: (e) =>
      @.$el.find(".icons-hover").removeClass("visible")

    deletePicture: (e) =>
      @.$el.hide()


    triggers:
      "click .pic-save" : "save:picture:clicked"
      # "click .pic-trash" : "delete:picture:clicked"

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
