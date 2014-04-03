class CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :require_login, only: [:destroy, :create, :update, :new]
  before_action :current_user, only: [ :destroy, :create, :update, :new]
  respond_to :json


  def show
    @category = Category.find params[:id]
  end

  def popular
    @categories = Category.select("categories.*, COUNT(tickets.id) AS t_count").joins(:tickets).group("categories.id").order("t_count DESC").limit(3)
  end


  def index
    @categories = Category.all
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
