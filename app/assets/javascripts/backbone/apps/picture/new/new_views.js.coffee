@TB.module "PictureApp.New", (New, App, Backbone, Marionette, $, _) ->


  class New.Layout extends App.Views.Layout
    template: "picture/new/new_layout"

    regions:
      pictureRegion:	"#picture-region"


  class New.Picture extends App.Views.ItemView
    template: "picture/new/_picture"

    triggers:
      "click #play" :     "play:video"
      "click #snapshot" : "take:snapshot"
      "click #video" :    "take:snapshot"
      "click #stop"  :    "stop:recording"

    onShow:->
      @playVideo()

    playVideo: ->
      # window.elll = @$el.find("#video")
      # video = @$el.find("#video")
      Recorder.play video, "both", ->
