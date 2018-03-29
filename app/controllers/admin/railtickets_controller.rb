class Admin::RailticketsController < ApplicationController

  before_action :set_railticket, only: [:show, :edit, :update, :destroy]

  def index
    @railtickets = Railticket.all.order(created_at: :desc).page(params[:page]).per(10)
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
      redirect_to admin_railticket_path(@railticket)
    else
      flash.now[:alert] = "Ticket was failed to update"
      render :edit
    end
  end

  def destroy
    @railticket.destroy
    redirect_to admin_railtickets_path
    flash[:alert] = "Ticket was deleted"
  end

  private

  def set_railticket
    @railtickets = Railticket.find(params[:id])
  end


  def railticket_params
    params.require(:railticket).permit(:train_no, :train_date, :departure_time, :arrive_time, :departure, :destination, :name, :price, :discount, :image, :others )
  end


end
