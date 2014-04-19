@TB.module "TicketApp.ShowByCat", (ShowByCat, App, Backbone, Marionette, $, _) ->

  class ShowByCat.Layout extends App.Views.Layout
    template: "ticket/showbycat/showbycat_layout"

    regions:
      ticketsRegion:		"#tickets-region"
      titleRegion:      "#title-region"

  class ShowByCat.Title extends App.Views.ItemView
    template: "ticket/showbycat/_title"


  class ShowByCat.Ticket extends App.Views.ItemView
    template: "ticket/showbycat/_ticket"
    tagName: "li"
    className: "ticket_li col-md-4"

    triggers:
      "click .ticket-delete button" : "ticket:delete:clicked"
      "click" 										  : "ticket:member:clicked"

  class ShowByCat.Empty extends App.Views.ItemView
    template: "ticket/showbycat/_empty"
    tagName:  "li"



  class ShowByCat.Tickets extends App.Views.CompositeView
    template: "ticket/showbycat/_tickets"
    itemView: ShowByCat.Ticket
    emptyView: ShowByCat.Empty
    itemViewContainer: "ul"

    onShow: ->
      @childElementsFadeIn()

    childElementsFadeIn: ->
      container = @$el
      container.isotope
        layoutMode : 'masonry'
        itemSelector: ".ticket_li"
