@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      ticket = App.request "new:ticket:entity"

      @listenTo ticket, "created", ->
        console.log "created"
        # id = conference.id
        # App.vent.trigger "conference:created", id, conference


      newView = @getNewView ticket
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    getNewView: (ticket) ->
      new New.Ticket
        model: ticket
