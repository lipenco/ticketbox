@TB.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Headers extends App.Views.CompositeView
		template: "header/list/headers"
