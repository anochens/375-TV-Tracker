class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @season = Season.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @season = Season.new(params[:season])
    if @season.save
      flash[:notice] = "Successfully created season."
      redirect_to @season
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @season = Season.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(params[:season])
      flash[:notice] = "Successfully updated season."
      redirect_to @season
    else
      render :action => 'edit'
    end
  end
<<<<<<< HEAD
end

=======

  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    flash[:notice] = "Successfully destroyed season."
    redirect_to seasons_url
  end
end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
