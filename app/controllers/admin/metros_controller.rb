class Admin::MetrosController < ApplicationController
  before_action :set_metro, only: [:show, :edit, :update, :destroy]

  def index
    @metros = Metro.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    #set_metro
  end

  def edit
    #set_metro
  end

  def update
    if @metro.update(metro_params)
      flash[:notice] = "Multiday pass was successfully updated"
      redirect_to admin_metro_path(@metro)
    else
      flash.now[:alert] = "Multiday pass was failed to update"
      render :edit
    end
  end

  def destroy
    @metro.destroy
    redirect_to admin_metros_path
    flash[:alert] = "Multiday pass was deleted"
  end

  private

  def set_metro
    @metro = Metro.find(params[:id])
  end

  def metro_params
    params.require(:metro).permit(:area, :ticket_type, :days, :expire_date, :image, :others)
  end


end
