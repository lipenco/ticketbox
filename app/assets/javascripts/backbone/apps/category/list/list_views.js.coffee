@TB.module "CategoryApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "category/list/list_layout"

    regions:
      categoriesRegion:	"#categories-region"
      newTicketRegion: "#new-ticket-region"


  class List.Category extends App.Views.ItemView
    template: "category/list/_category"
    tagName: "li"

    triggers:
      "click" : "category:chosen:new"

  class List.Empty extends App.Views.ItemView
    template: "category/list/_empty"
    tagName:  "li"

  class List.Categories extends App.Views.CompositeView
    template: "category/list/_categories"
    itemView: List.Category
    emptyView: List.Empty
    itemViewContainer: "ul"
