@TB.module "CategoryApp.UserList", (UserList, App, Backbone, Marionette, $, _) ->

  class UserList.Layout extends App.Views.Layout
    template: "category/userlist/list_layout"

    regions:
      categoriesRegion: "#categories-user-region"
      # newTicketRegion: "#new-ticket-region"


  class UserList.Category extends App.Views.ItemView
    template: "category/userlist/_category"
    tagName: "li"
    className: "col-md-4"

    triggers:
      "click button.showtickets" : "category:show:tickets"

  class UserList.Empty extends App.Views.ItemView
    template: "category/userlist/_empty"
    tagName:  "li"

  class UserList.Categories extends App.Views.CompositeView
    template: "category/userlist/_categories"
    itemView: UserList.Category
    emptyView: UserList.Empty
    itemViewContainer: "ul"

    triggers:
      "click .showall" : "category:show:all"
