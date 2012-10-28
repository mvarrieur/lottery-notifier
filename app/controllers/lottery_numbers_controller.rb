class LotteryNumbersController < ApplicationController
  def index
    @lottery_numbers = LotteryNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lottery_numbers }
    end
  end

  def current
    @lottery_number = LotteryNumber.current
  end

  def show
    @lottery_number = LotteryNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lottery_number }
    end
  end

  def new
    @lottery_number = LotteryNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lottery_number }
    end
  end

  def edit
    @lottery_number = LotteryNumber.find(params[:id])
  end

  def create
    @lottery_number = LotteryNumber.new(params[:lottery_number])

    respond_to do |format|
      if @lottery_number.save
        format.html { redirect_to @lottery_number, notice: 'Lottery number was successfully created.' }
        format.json { render json: @lottery_number, status: :created, location: @lottery_number }
      else
        format.html { render action: "new" }
        format.json { render json: @lottery_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lottery_number = LotteryNumber.find(params[:id])

    respond_to do |format|
      if @lottery_number.update_attributes(params[:lottery_number])
        format.html { redirect_to @lottery_number, notice: 'Lottery number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lottery_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lottery_number = LotteryNumber.find(params[:id])
    @lottery_number.destroy

    respond_to do |format|
      format.html { redirect_to lottery_numbers_url }
      format.json { head :no_content }
    end
  end

  def get_latest
    @saved = LotteryNumber.get_latest

    respond_to do |format|
      if @saved
        format.html { redirect_to action: 'email_winner', controller: 'users' }
      else
        format.html { render action: "new" }
        format.json { render json: @saved.errors, status: :unprocessable_entity }
      end
    end
  end
end
