class HomeController < ApplicationController
  def index
	  respond_to do |format|
	  	format.html
		format.js { render :nothing=>true }
	  end 
  end

  def info
  end
end
