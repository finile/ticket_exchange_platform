class MetrosController < ApplicationController
  before_action :set_metro, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]

  def index
    @metros = Metro.all.order(favorites_count: :desc).limit(9)
    @search = Search.new
  end

  def new
    @metro = Metro.new
  end

  def create
    @metro = current_user.metros.new(metro_params)
    if @metro.save
      flash[:notice] = "Multiday Pass was successfully created"
      redirect_to metro_path(@metro)
    else
      flash.now[:alert] = "Multiday Pass was failed to create"
      redirect_to metros_url
    end
  end

  def show
    #set_metro
    @comment = Comment.new
  end

  def edit
    #set_metro
  end

  def update
    if @metro.update(metro_params)
      flash[:notice] = "Multiday Pass was successfully updated"
      redirect_to metro_path(@metro)
    else
      flash.now[:alert] = "Multiday Pass was failed to update"
      render :edit
    end
  end

  def destroy
    @metro.destroy
    redirect_to user_path(current_user)
    flash[:alert] = "Multiday Pass was deleted"
  end

  def favorite
    @metro.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(metro: @metro, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end



private

  def set_metro
    @metro = Metro.find(params[:id])
  end

  def metro_params
    params.require(:metro).permit(:ticket_type, :days, :expire_date, :area, :price, :image, :others )
  end

end
