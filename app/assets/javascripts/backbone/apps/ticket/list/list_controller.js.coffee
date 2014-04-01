@TB.module "TicketApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Application

  	initialize: ->
      console.log "here"
      tickets = App.request "ticket:entities"

      @layout = @getLayoutView tickets

      @listenTo @layout, "show", =>
        @panelRegion()
        @ticketsRegion tickets

      @show @layout, loading: true


  	panelRegion: ->
  		panelView = @getPanelView()

  		@listenTo panelView, "new:ticket:button:clicked", =>
  			@newRegion()

  		@layout.panelRegion.show panelView

  	newRegion: ->
  		App.execute "new:ticket:create", @layout.newRegion

  	ticketsRegion: (tickets) ->
  		ticketView = @getTicketsView tickets

  		# @listenTo crewView, "childview:ticket:member:clicked", (child, args) ->
  		# 	App.vent.trigger "ticket:member:clicked", args.model
      #
  		# @listenTo crewView, "childview:ticket:delete:clicked", (child, args) ->
  		# 	model = args.model
  		# 	if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

  		@layout.ticketsRegion.show ticketView

  	getTicketsView: (tickets) ->
  		new List.Tickets
  			collection: tickets

  	getPanelView: ->
  		new List.Panel


  	getLayoutView: (tickets) ->
  		new List.Layout
  			collection: tickets
