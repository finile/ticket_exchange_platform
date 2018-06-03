class Admin::ParkticketsController < ApplicationController
  before_action :set_parkticket, only: [:show, :edit, :update, :destroy]

  def index
    @parktickets = Parkticket.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    #set_parkticket
  end

  def edit
    #set_parkticket
  end

  def update
    if @parkticket.update(parkticket_params)
      flash[:notice] = "Parkticket was successfully updated"
      redirect_to admin_parkticket_path(@parkticket)
    else
      flash.now[:alert] = "Parkticket was failed to update"
      render :edit
    end
  end

  def destroy
    @parkticket.destroy
    redirect_to admin_parktickets_path
    flash[:alert] = "Parkticket was deleted"
  end

  private

  def set_parkticket
    @parkticket = Parkticket.find(params[:id])
  end

  def parkticket_params
    params.require(:parkticket).permit(:park_name, :park_expiry_date, :price, :quantity, :image, :others, :quantity)
  end


end
