class TicketsController < ApplicationController



  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]

    def index
      @tickets = Ticket.page(params[:page]).per(20)


    end

    def new
      @ticket = Ticket.new
    end

    def create
      @ticket = Ticket.new(ticket_params)
      @ticket.save

      redirect_to tickets_url
    end

    def show
      #set_ticket
      
      @comment = Comment.new
    end

    def edit
      #set_ticket
    end

    def update
      if @ticket.update(ticket_params)
        flash[:notice] = "Ticket was successfully updated"
        redirect_to ticket_path(@ticket)
      else
        flash.now[:alert] = "Ticket was failed to update"
        render :edit
      end
    end

    def destroy
      @ticket.destroy
      redirect_to tickets_path
      flash[:alert] = "Ticket was deleted"
    end

    def favorite

      @ticket.favorites.create!(user: current_user)
      redirect_back(fallback_location: root_path)
    end

   def unfavorite

     favorites = Favorite.where(ticket: @ticket, user: current_user)
     favorites.destroy_all
     redirect_back(fallback_location: root_path)
   end

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end


    def ticket_params
      params.require(:ticket).permit(:airline, :flight_no, :flight_date, :flight_time, :departure, :destination, :name, :price, :image, :others )
    end
end
