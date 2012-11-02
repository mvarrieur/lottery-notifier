class LotteryNumbersController < ApplicationController
  def index
    @lottery_numbers = LotteryNumber.paginate(:page => params[:page]).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lottery_numbers }
    end
  end

  def current
    @lottery_number = LotteryNumber.current

    respond_to do |format|
      format.html
      format.json { render json: @lottery_number }
    end
  end

  def show
    @lottery_number = LotteryNumber.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @lottery_number }
    end
  end

end
