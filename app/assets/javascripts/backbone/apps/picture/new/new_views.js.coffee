@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Layout extends App.Views.Layout
    template: "picture/new/new_layout"

    regions:
      pictureRegion:	"#picture-region"
      takenPicturesRegion: "#taken-pictures-region"



  class New.TakenPicture extends App.Views.ItemView
    template: "picture/new/_takenpicture"
    tagName: "li"
    className: "col-md-4"

    triggers:
      "click button.showtickets" : "category:show:tickets"

  class New.Empty extends App.Views.ItemView
    template: "picture/new/_empty"
    tagName:  "li"

  class New.TakenPictures extends App.Views.CompositeView
    template: "picture/new/_takenpictures"
    itemView: New.TakenPicture
    emptyView: New.Empty
    itemViewContainer: "ul"




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
