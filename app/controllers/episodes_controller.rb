class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @ratings = @episode.ratings
  end

<<<<<<< HEAD
=======
  def new
    @episode = Episode.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @episode = Episode.new(params[:episode])
    if @episode.save
      flash[:notice] = "Successfully created episode."
      redirect_to @episode
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @episode = Episode.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      flash[:notice] = "Successfully updated episode."
      redirect_to @episode
    else
      render :action => 'edit'
    end
  end
<<<<<<< HEAD
=======

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    flash[:notice] = "Successfully destroyed episode."
    redirect_to episodes_url
  end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
end
