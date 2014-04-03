@TB.module "CategoryApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "category/list/list_layout"

    regions:
      categoriesRegion:	"#categories-region"


  class List.Category extends App.Views.ItemView
    template: "category/list/_category"
    tagName: "li"

    # triggers:
    #   "click .ticket-delete button" : "ticket:delete:clicked"
    #   "click" 										  : "ticket:member:clicked"

  class List.Empty extends App.Views.ItemView
    template: "category/list/_empty"
    tagName:  "li"

  class List.Categories extends App.Views.CompositeView
    template: "category/list/_categories"
    itemView: List.Category
    emptyView: List.Empty
    itemViewContainer: "ul"
