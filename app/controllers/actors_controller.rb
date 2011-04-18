class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @actor = Actor.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      flash[:notice] = "Successfully created actor."
      redirect_to @actor
    else
      render :action => 'new'
    end
  end
<<<<<<< HEAD
=======

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(params[:actor])
      flash[:notice] = "Successfully updated actor."
      redirect_to @actor
    else
      render :action => 'edit'
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    flash[:notice] = "Successfully destroyed actor."
    redirect_to actors_url
  end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
end
