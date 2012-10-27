class LotteryNumbersController < ApplicationController
  # GET /lottery_numbers
  # GET /lottery_numbers.json
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

  # GET /lottery_numbers/1
  # GET /lottery_numbers/1.json
  def show
    @lottery_number = LotteryNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lottery_number }
    end
  end

  # GET /lottery_numbers/new
  # GET /lottery_numbers/new.json
  def new
    @lottery_number = LotteryNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lottery_number }
    end
  end

  # GET /lottery_numbers/1/edit
  def edit
    @lottery_number = LotteryNumber.find(params[:id])
  end

  # POST /lottery_numbers
  # POST /lottery_numbers.json
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

  # PUT /lottery_numbers/1
  # PUT /lottery_numbers/1.json
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

  # DELETE /lottery_numbers/1
  # DELETE /lottery_numbers/1.json
  def destroy
    @lottery_number = LotteryNumber.find(params[:id])
    @lottery_number.destroy

    respond_to do |format|
      format.html { redirect_to lottery_numbers_url }
      format.json { head :no_content }
    end
  end

  def get_latest
    #debugger
    @lottery_number = LotteryNumber.get_latest

    respond_to do |format|
      if @lottery_number.save
        format.html { redirect_to @lottery_number, notice: 'Latest Lottery Number successfully grabbed.' }
        format.json { render json: @lottery_number, status: :created, location: @lottery_number }
      else
        format.html { render action: "new" }
        format.json { render json: @lottery_number.errors, status: :unprocessable_entity }
      end
    end
  end
end
