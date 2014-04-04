@TB = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.addRegions
		sidebarRegion: "#side-menu"
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		photoRegion:  "#photo-region"
		# footerRegion: "#footer-region"



	App.rootRoute = Routes.tickets_path()

	App.on "initialize:before", (options) ->
		@currentUser = App.request "set:current:user", options.currentUser
		# @favorites = App.request "set:current:favorites", options.currentUser

	App.reqres.setHandler "get:current:user", ->
		App.currentUser

	App.reqres.setHandler "get:current:favorites", ->
		App.favorites

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("SidemenuApp").start()
		# App.module("FooterApp").start()


	App.reqres.setHandler "default:region", ->
		App.mainRegion


	App.on "initialize:after", ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App
