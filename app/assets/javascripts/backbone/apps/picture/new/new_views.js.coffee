@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Layout extends App.Views.Layout
    template: "picture/new/new_layout"

    regions:
      pictureRegion:	"#picture-region"
      takenPicturesRegion: "#taken-pictures-region"
      ticketPrevRegion: "#ticket-prev-region"

    triggers:
      "click #stop"  :    "stop:recording"


  class New.Empty extends App.Views.ItemView
    template: "picture/new/_empty"
    tagName:  "li"
    className: "col-md-12"


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
      "click #snapshot" : "take:snapshot"
      "click #video" :    "take:snapshot"
      "click #stop"  :    "stop:recording"

    onShow:->
      @playVideo()

    playVideo: ->
      @$el.find("#video").addClass("videoo")
      Recorder.play video, "both", ->
