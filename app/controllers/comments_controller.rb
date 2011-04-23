class CommentsController < ApplicationController
  def create
    @episode = Episode.find(params[:episode_id])
    @comment = @episode.comments.create(params[:comment])
    @comment.name = current_user.username
	 flash[:error] = "Comment cannot be blank" unless @comment.save
    redirect_to episode_path(@episode)
  end
end
