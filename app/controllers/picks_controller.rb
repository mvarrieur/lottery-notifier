class PicksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @picks = current_user.picks.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @picks }
    end
  end

  def show
    @pick = Pick.find(params[:id])

    if (@pick.user == current_user)
      respond_to do |format|
        format.html
        format.json { render json: @pick }
      end
    else
      render :file => "public/401.html", :status => :unauthorized
    end
  end

  def new
    @pick = Pick.new

    respond_to do |format|
      format.html
      format.json { render json: @pick }
    end
  end

  def edit
    @pick = Pick.find(params[:id])
  end

  def create
    @pick = Pick.new(params[:pick])
    @pick.user = current_user

    respond_to do |format|
      if @pick.save
        format.html { redirect_to @pick, notice: 'Pick was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pick = Pick.find(params[:id])

    respond_to do |format|
      if @pick.update_attributes(params[:pick])
        format.html { redirect_to @pick, notice: 'Pick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end
end
