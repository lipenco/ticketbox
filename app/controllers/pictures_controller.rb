class PicturesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :new]
  before_action :current_user, only: [ :destroy, :create, :update, :new]
  respond_to :json


  def show
    @picture = Picture.find params[:id]
  end



  def index
    @ticket = Ticket.find params[:ticket_id]
    @pictures = @ticket.pictures
  end

  def new
    @picture = Picture.new(picture_params)
  end

  def create
    @picture = Picture.new(picture_params.merge(:ticket_id => params[:ticket_id]))

    if @picture.save
      render "pictures/show"
    else
      respond_with @ticket
    end
  end

  def update
    @picture = Picture.find params[:id]
    if @picture.update_attributes picture_params
      @ticket = Ticket.find(params[:ticket_id])
      render "tickets/show"
    else
      respond_with @ticket
    end
  end


  def destroy
    picture = Picture.find params[:id]
    picture.destroy
    render json: {}
  end

  private


  def picture_params
    params.permit(:file, :url, :ticket_id)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      render json: {} # halts request cycle
    end
  end





end
