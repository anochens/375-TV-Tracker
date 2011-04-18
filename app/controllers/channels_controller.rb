class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @channel = Channel.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @channel = Channel.new(params[:channel])
    if @channel.save
      flash[:notice] = "Successfully created channel."
      redirect_to @channel
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @channel = Channel.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(params[:channel])
      flash[:notice] = "Successfully updated channel."
      redirect_to @channel
    else
      render :action => 'edit'
    end
  end
<<<<<<< HEAD
=======

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    flash[:notice] = "Successfully destroyed channel."
    redirect_to channels_url
  end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
end
