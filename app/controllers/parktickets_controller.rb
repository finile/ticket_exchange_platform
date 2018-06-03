class ParkticketsController < ApplicationController

  def index
    @parktickets = Parkticket.all
  end

  def new
    @parkticket = Parkticket.new
  end

  def create
    @parkticket = current_user.parktickets.new(ticket_params)
    if @parkticket.save
      flash[:notice] = "ticket was successfully created"
      redirect_to parkticket_path(@parkticket)
    else
      flash.now[:alert] = "ticket was failed to create"
      redirect_to root_path
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    
  end

  def update
    if @parkticket.update(ticket_params)
      flash[:notice] = "Ticket was successfully updated"
      redirect_to root_path
    else
      flash.now[:alert] = "Ticket was failed to update"
      render :edit
    end
  end

  def destroy
    @parkticket.destroy
    redirect_to user_path(current_user)
    flash[:alert] = "Ticket was deleted"
  end

  def favorite
    @parkticket.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(parkticket: @parkticket, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def set_parkticket
    @parkticket = Parkticket.find(params[:id])
  end

  def parkticket_params
    params.require(:parkticket).permit(:park_name, :park_expiry_date, :price, :quantity, :image, :others)
  end

end
