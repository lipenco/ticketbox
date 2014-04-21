@TB.module "LandingApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "landingpage/show/show_layout"

    regions:
      landingRegion: "#landing-region"



  class Show.Landing extends App.Views.ItemView
    template: "landingpage/show/_landing"

    triggers:
      "click #shine" : "open:menu:clicked"

    events:
      "mousemove" : "shinetrigger"

    onShow:->
      @shineSetup()

    shineSetup:->
      window.shine = new Shine(document.getElementById('shine'))

    shinetrigger:->
      shine.light.position.x = event.clientX
      shine.light.position.y = event.clientY
      shine.draw()
