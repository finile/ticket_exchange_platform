class CouponsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coupon, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite, :add_to_cart, :remove_from_cart ]

  def index
    @coupons = Coupon.all.order(favorites_count: :desc).limit(6)
    @search = Search.new
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = current_user.coupons.new(coupon_params)
    if @coupon.save
      flash[:notice] = "coupon was successfully created"
      redirect_to coupon_path(@coupon)
    else
      flash.now[:alert] = "coupon was failed to create"
      redirect_to root_path
    end
  end

  def show
    #set_coupon
    @comment = Comment.new
  end

  def edit
    #set_coupon
  end

  def update
    if @coupon.update(coupon_params)
      flash[:notice] = "Coupon was successfully updated"
      redirect_to coupon_path(@coupon)
    else
      flash.now[:alert] = "Coupon was failed to update"
      render :edit
    end
  end

  def destroy
    @coupon.destroy
    redirect_to user_path(current_user)
    flash[:alert] = "Coupon was deleted"
  end

  def favorite
    @coupon.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
   favorites = Favorite.where(coupon: @coupon, user: current_user)
   favorites.destroy_all
   redirect_back(fallback_location: root_path)
  end

  def add_to_cart
    if current_cart.add_cart_item(@coupon)
      @coupon.quantity = 0
      @coupon.save
    end
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    cart_item = current_cart.cart_items.find_by(coupon_id: @coupon)
    @coupon.quantity = cart_item.quantity
    @coupon.save
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end


  def coupon_params
    params.require(:coupon).permit(:airline, :destination, :coupon_expiry_date, :flight_date_from, :flight_date_to, :tax, :image, :others, :price, :quantity, :departure)
  end

end
