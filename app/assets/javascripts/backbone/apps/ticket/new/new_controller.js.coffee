@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      ticket = App.request "new:ticket:entity"


      @listenTo ticket, "created", ->
        console.log "created"
        @pictureRegion(ticket)
        # id = conference.id
        # App.vent.trigger "conference:created", id, conference


      newView = @getNewView ticket
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    pictureRegion: (ticket)->
      App.execute "add:picture:new", @region, ticket

    getNewView: (ticket) ->
      new New.Ticket
        model: ticket
