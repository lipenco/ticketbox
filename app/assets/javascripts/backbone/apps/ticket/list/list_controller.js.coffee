@TB.module "TicketApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: ->
      currentUser = App.request "get:current:user"
      currentUserId = currentUser.get("id")
      if currentUserId
        tickets = App.request "category:entities"
        @layout = @getLayoutView tickets

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @addToCatRegion()
          @userCategoriesRegion()

        @show @layout, loading: true
      else
        App.vent.trigger "landing:page:show"




    addToCatRegion: ->
      App.execute "list:categories", @layout.addToCatRegion

    userCategoriesRegion: ->
      App.execute "list:user:categories", @layout.userCategoriesRegion


    ticketsRegion: (tickets) ->
      ticketView = @getTicketsView tickets
      # @layout.conferenceRegion.show conferenceView
      @show ticketView, region: @layout.ticketsRegion


    getTicketsView: (tickets) ->
      new List.Tickets
        collection: tickets

    getPanelView: ->
      new List.Panel



    getLayoutView: (tickets) ->
      new List.Layout
        collection: tickets
