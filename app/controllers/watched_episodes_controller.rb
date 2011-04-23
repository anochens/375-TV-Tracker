class WatchedEpisodesController < ApplicationController
  before_filter :login_required
  def index
    @watched_episodes = current_user.watched_episodes
  end

  def show
    @watched_episode = WatchedEpisode.find(params[:id])
  end

  def create
    params[:watched_episode] ||= {}
    params[:watched_episode][:user_id] = current_user.id
    @watched_episode = WatchedEpisode.new(params[:watched_episode])
    if @watched_episode.save
      redirect_to :back
    else
      render :action => 'new'
    end
  end

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
