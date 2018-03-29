class ComboardsController < ApplicationController
  before_action :set_comboard, only: [:show, :edit, :update, :destroy]

    def index
      @comboards = Comboard.page(params[:page]).per(10)
      @comboard = Comboard.new
    end

    def new
      @comboard = Comboard.new
    end

    def create
      @comboard = current_user.comboards.new(comboard_params)
      if @comboard.save
        flash[:notice] = "Message was successfully created"
        redirect_to comboards_url
      else
        flash.now[:alert] = "Message was failed to create"
        redirect_to comboards_url
      end
    end

    def show
      #set_comboard

      @comment = Comment.new
    end

    def edit
      #set_comboard
    end

    def update
      if @comboard.update(comboard_params)
        flash[:notice] = "Message was successfully updated"
        redirect_to comboard_path(@comboard)
      else
        flash.now[:alert] = "Message was failed to update"
        render :edit
      end
    end

    def destroy
      @comboard.destroy
      redirect_to comboards_path
      flash[:alert] = "Message was deleted"
    end

    

  private

    def set_comboard
      @comboard = Comboard.find(params[:id])
    end


    def comboard_params
      params.require(:comboard).permit(:flight_date_from, :flight_date_to, :departure, :destination, :name, :price, :content )
    end

end
