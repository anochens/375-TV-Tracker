class CommentsController < ApplicationController
  def create
    @episode = Episode.find(params[:episode_id])
    @comment = @episode.comments.create(params[:comment])
    redirect_to episode_path(@episode)
  end
end
