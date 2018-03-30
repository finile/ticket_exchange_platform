class RailticketsController < ApplicationController
  
  before_action :set_railticket, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite, :add_to_rail_cart, :remove_from_rail_cart]

  def index
    @railtickets = Railticket.all.order(favorites_count: :desc).limit(6)
    @search = Search.new
  end

  def new
    @railticket = Railticket.new
  end

  def create
    @railticket = current_user.railtickets.new(railticket_params)
    if @railticket.save
      flash[:notice] = "railticket was successfully created"
      redirect_to railticket_path(@railticket)
    else
      flash.now[:alert] = "railticket was failed to create"
      redirect_to railtickets_url
    end
  end

  def show
    #set_railticket
    @comment = Comment.new
  end

  def edit
    #set_railticket
  end

  def update
    if @railticket.update(railticket_params)
      flash[:notice] = "Ticket was successfully updated"
      redirect_to railticket_path(@railticket)
    else
      flash.now[:alert] = "Ticket was failed to update"
      render :edit
    end
  end

  def destroy
    @railticket.destroy
    redirect_to user_path(current_user)
    flash[:alert] = "Ticket was deleted"
  end

  def favorite
    @railticket.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(railticket: @railticket, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  def add_to_rail_cart
    if current_rail_cart.add_rail_cart_item(@railticket)
      @railticket.quantity = 0
      @railticket.save
    end
      redirect_back(fallback_location: root_path)
  end

  def remove_from_rail_cart
    rail_cart_item = current_rail_cart.rail_cart_items.find_by(railticket_id: @railticket)
    @railticket.quantity = rail_cart_item.quantity
    @railticket.save
    rail_cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_railticket
    @railticket = Railticket.find(params[:id])
  end

  def railticket_params
    params.require(:railticket).permit(:train_no, :train_date, :departur_time, :arrive_time, :departure, :destination, :name, :price, :discount, :image, :others )
  end

end
