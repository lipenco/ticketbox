@TB.module "SidemenuApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "sidemenu/show/show_layout"

    regions:
      nameRegion: "#name-region"
      loginRegion: "#login-region"
      logoutRegion: "#logout-region"


  class Show.Name extends App.Views.ItemView
    template: "sidemenu/show/_name"

    triggers:
      "click #close-menu" : "close:button:clicked"


  class Show.Login extends App.Views.ItemView
    template: "sidemenu/show/_login"
