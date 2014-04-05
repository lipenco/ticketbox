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
      # window.f = formView
      # window.f = formView
      # formView.$el.find($('#dp1')).datepicker()

      # $('#dp1').datepicker({format: 'mm-dd-yyyy'})

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    # pictureRegion: (ticket)->
    #   App.execute "add:picture:new", @region, ticket

    getNewView: (ticket) ->
      new New.Ticket
        model: ticket
