class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(params[:season])
    if @season.save
      flash[:notice] = "Successfully created season."
      redirect_to @season
    else
      render :action => 'new'
    end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(params[:season])
      flash[:notice] = "Successfully updated season."
      redirect_to @season
    else
      render :action => 'edit'
    end
  end
end
