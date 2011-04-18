class WatchedEpisodesController < ApplicationController
  before_filter :login_required
  def index
    @watched_episodes = current_user.watched_episodes
  end

  def show
    @watched_episode = WatchedEpisode.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @watched_episode = WatchedEpisode.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    params[:watched_episode] ||= {}
    params[:watched_episode][:user_id] = current_user.id
    @watched_episode = WatchedEpisode.new(params[:watched_episode])
    if @watched_episode.save
<<<<<<< HEAD
=======
#     flash[:notice] = "Successfully created watched episode."
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
      redirect_to :back
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @watched_episode = WatchedEpisode.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @watched_episode = WatchedEpisode.find(params[:id])
    params[:watched_episode][:user_id] = current_user.id
    if @watched_episode.update_attributes(params[:watched_episode])
      flash[:notice] = "Successfully updated watched episode."
      redirect_to watched_episodes_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @watched_episode = WatchedEpisode.find(params[:id])
    @watched_episode.destroy
    flash[:notice] = "Successfully destroyed watched episode."
    redirect_to :back
  end
end
