@TB.module "TicketApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options)->
      {category} = options
      window.uu = category
      cat_id = category.id.id
      ticket = App.request "new:ticket:entity", cat_id


      @listenTo ticket, "created", ->
        console.log "created"
        App.execute "add:picture:new", ticket
        @region.close()



      newView = @getNewView ticket
      formView = App.request "form:wrapper", newView


      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView


    getNewView: (ticket) ->
      new New.Ticket
        model: ticket
