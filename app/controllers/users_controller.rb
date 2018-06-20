class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posted_tickets = @user.tickets
    @posted_coupons = @user.coupons
    @posted_railtickets = @user.railtickets
    @posted_metros = @user.metros
    @posted_parktickets = @user.parktickets
    @favorited_tickets = @user.favorited_tickets
    @favorited_coupons = @user.favorited_coupons
    @favorited_railtickets = @user.favorited_railtickets
    @favorited_metros = @user.favorited_metros
    @favorited_parktickets = @user.favorited_parktickets
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User information was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Ticket was failed to update"
      render :edit
    end
  end

  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone, :address)
  end


end
