class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])   
    @posted_tickets = @user.tickets
    @posted_coupons = @user.coupons
    @posted_railtickets = @user.railtickets
    @favorited_tickets = @user.favorited_tickets
    @favorited_railtickets = @user.favorited_railtickets
    @favorited_coupons = @user.favorited_coupons
  end

end
