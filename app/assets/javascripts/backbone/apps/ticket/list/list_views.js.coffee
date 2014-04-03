@TB.module "TicketApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "ticket/list/list_layout"

		regions:
			newRegion:		"#new-region"
			ticketsRegion: "#tickets-region"
			addToCatRegion: "#add-to-category-region"
			userCategoriesRegion: "#categories-region"


	class List.Panel extends App.Views.ItemView
		template: "ticket/list/_panel"

		triggers:
			"click #new-ticket" : "new:ticket:button:clicked"

	class List.Ticket extends App.Views.ItemView
		template: "ticket/list/_ticket"
		tagName: "li"

		triggers:
			"click .ticket-delete button" : "ticket:delete:clicked"
			"click" 										  : "ticket:member:clicked"

	class List.Empty extends App.Views.ItemView
		template: "ticket/list/_empty"
		tagName:  "li"

	class List.Tickets extends App.Views.CompositeView
		template: "ticket/list/_tickets"
		itemView: List.Ticket
		emptyView: List.Empty
		itemViewContainer: "ul"
