class TicketsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :new]
  before_action :current_user, only: [ :destroy, :create, :update, :new, :user_list]
  respond_to :json

  def index
    @tickets = current_user.tickets.all
    # @tickets = Ticket.all
  end


  def new
    @ticket = Ticket.new(ticket_params)
  end

  def create
    @ticket = @current_user.tickets.new(ticket_params.merge(:category_id => params[:category_id]))
    if @ticket.save
      render "tickets/show"
    else
      respond_with @ticket
    end
  end

  def update
    @ticket = Ticket.find params[:id]
    if @ticket.update_attributes ticket_params
      render "tickets/show"
    else
      respond_with @ticket
    end
  end

  def show
    @ticket = Tickets.find(params[:id])
  end

  def destroy
    ticket = @current_user.tickets.find params[:id]

    single.destroy
    render json: {}
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      render json: {} # halts request cycle
    end
  end

  def ticket_params
    params.permit(:name, :date, :user_id)
  end

end
