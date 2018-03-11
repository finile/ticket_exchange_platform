class TicketsController < ApplicationController

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def index
      @tickets = Ticket.all
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

  private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end


    def ticket_params
      params.require(:ticket).permit(:airline, :flight_no, :flight_date, :flight_time, :departure, :destination, :name, :price, :image, :others )
    end
end


