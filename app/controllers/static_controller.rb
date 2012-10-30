class StaticController < ApplicationController
  def info
    respond_to do |format|
      format.html
    end
  end
end