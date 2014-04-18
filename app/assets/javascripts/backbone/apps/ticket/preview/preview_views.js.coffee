@TB.module "TicketApp.Prev", (Prev, App, Backbone, Marionette, $, _) ->

  class Prev.Layout extends App.Views.Layout
    template: "ticket/preview/prev_layout"

    regions:
      nameRegion:   "#name-region"
      descriptionRegion: "#description-region"
      ticketRegion:		"#ticket-region"
      picturesRegion:  "#pictures-region"

  class Prev.Name extends App.Views.ItemView
    template: "ticket/preview/_name"

  class Prev.Description extends App.Views.ItemView
    template: "ticket/preview/_description"

    events:
      "keydown" : 'strokeDetector'

    strokeDetector: (e) =>
      model = @.model
      if (e.keyCode ==32 || e.keyCode ==190 )
        @trigger "description:save", (model)


  class Prev.Picture extends App.Views.ItemView
    template: "ticket/preview/_picture"
    tagName: "li"



  class Prev.Empty extends App.Views.ItemView
    template: "ticket/preview/_empty"
    tagName:  "li"

  class Prev.Pictures extends App.Views.CompositeView
    template: "ticket/preview/_pictures"
    itemView: Prev.Picture
    emptyView: Prev.Empty
    itemViewContainer: "ul"
