class SearchesController < ApplicationController

    def new
      @search = Search.new
    end

    def create
      @search = Search.new(search_params)
      @search.save
      redirect_to search_path(@search)
    end

    def show
      @search = Search.find(params[:id])
    end


  private

    def search_params
      params.require(:search).permit(:airline, :flight_no, :date_from, :date_to, :min_price, :max_price, :destination, :train_no, :departure)
    end


end
