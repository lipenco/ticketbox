@TB.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Header extends App.Views.ItemView
		template: "header/list/_header"
		tagName: "li"

		triggers:
			"click .left-open" : "nav:open:sidemenu"



	class List.Headers extends App.Views.CompositeView
		template: "header/list/headers"
		itemView: List.Header
		itemViewContainer: "ul"
