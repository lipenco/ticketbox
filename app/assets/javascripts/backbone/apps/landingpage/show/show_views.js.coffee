@TB.module "LandingApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "landingpage/show/show_layout"

    regions:
      landingRegion: "#landing-region"



  class Show.Landing extends App.Views.ItemView
    template: "landingpage/show/_landing"

    triggers:
      "click .wrapper-top" : "open:menu:clicked"
