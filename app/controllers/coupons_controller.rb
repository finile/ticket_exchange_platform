class CouponsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  
  def index
    @coupons = Coupon.all  
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = current_user.coupons.new(coupon_params)
    if @coupon.save
      flash[:notice] = "coupon was successfully created"
      redirect_to coupons_url
    else  
      flash.now[:alert] = "coupon was failed to create"
      redirect_to root_path
    end
  end

  def show
    #set_coupon 
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
    redirect_to tickets_path
    flash[:alert] = "Coupon was deleted"
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end


  def coupon_params
    params.require(:coupon).permit(:airline, :destination, :coupon_expiry_date, :flight_date_from, :flight_date_to, :tax, :image, :others)
  end

end
