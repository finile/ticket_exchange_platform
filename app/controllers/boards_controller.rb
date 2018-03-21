class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

    def index

      @boards = Board.page(params[:page]).per(10)

    end

    def new
      @board = Board.new
    end

    def create
      @board = current_user.board.new(board_params)
      if @board.save
        flash[:notice] = "Message was successfully created"
        redirect_to boards_url
      else
        flash.now[:alert] = "Message was failed to create"
        redirect_to boards_url
      end
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

    def notify_buyer
      if @board.save

         UserMailer.notify_buyer(@board).deliver_now!
         redirect_to boards_path, notice: "notice has been sent"

       end
    end

  private

    def set_board
      @board = Board.find(params[:id])
    end


    def board_params
      params.require(:board).permit(:flight_date_from, :flight_date_to, :departure, :destination, :name, :price, :content )
    end

end
