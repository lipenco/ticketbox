@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options)->
      {category} = options
      cat_id = category.id
      ticket = App.request "new:ticket:entity", cat_id


      @listenTo ticket, "created", ->
        console.log "created"
        App.execute "add:picture:new", ticket
        @region.close()
        # @pictureRegion(ticket)
        # id = conference.id
        # App.vent.trigger "conference:created", id, conference


      newView = @getNewView ticket
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    # pictureRegion: (ticket)->
    #   App.execute "add:picture:new", @region, ticket

    getNewView: (ticket) ->
      new New.Ticket
        model: ticket
