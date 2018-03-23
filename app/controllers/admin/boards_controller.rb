class Admin::BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

     def index

       @boards = Board.page(params[:page]).per(10)

     end



     def show
       #set_board

       @comment = Comment.new
     end

     def edit
       #set_board
     end

     def update
       if @board.update(board_params)
         flash[:notice] = "Message was successfully updated"
         redirect_to board_path(@board)
       else
         flash.now[:alert] = "Message was failed to update"
         render :edit
       end
     end

     def destroy
       @board.destroy
       redirect_to boards_path
       flash[:alert] = "Message was deleted"
     end

     


   private

     def set_board
       @board = Board.find(params[:id])
     end


     def board_params
       params.require(:board).permit(:flight_date_from, :flight_date_to, :departure, :destination, :name, :price, :content )
     end



end
