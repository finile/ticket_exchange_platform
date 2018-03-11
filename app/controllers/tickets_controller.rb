class TicketsController < ApplicationController

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
    @ticket = Ticket.find(params[:id])    
  end

  private

  def ticket_params
    params.require(:ticket).permit(:airline, :flight_no, :flight_date, :flight_time, :departure, :destination, :name, :price, :image, :others )
  end
end


