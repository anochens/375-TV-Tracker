class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end

  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      flash[:notice] = "Successfully created channel."
      redirect_to @channel
    else
      render :action => 'new'
    end
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(params[:channel])
      flash[:notice] = "Successfully updated channel."
      redirect_to @channel
    else
      render :action => 'edit'
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    flash[:notice] = "Successfully destroyed channel."
    redirect_to channels_url
  end
end
