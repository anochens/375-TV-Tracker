class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      flash[:notice] = "Successfully created actor."
      redirect_to @actor
    else
      render :action => 'new'
    end
  end
end
