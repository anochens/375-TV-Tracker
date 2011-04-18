class SeriesItemsController < ApplicationController
  def index
    @series_items = SeriesItem.all
  end

  def show
    @series_item = SeriesItem.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @series_item = SeriesItem.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @series_item = SeriesItem.new(params[:series_item])
    @series_item.remote_image_url = params[:series_item][:remote_image_url]
    if @series_item.save
      flash[:notice] = "Successfully created series item."
      redirect_to @series_item
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @series_item = SeriesItem.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @series_item = SeriesItem.find(params[:id])
    if @series_item.update_attributes(params[:series_item])
      flash[:notice] = "Successfully updated series item."
      redirect_to @series_item
    else
      render :action => 'edit'
    end
  end
<<<<<<< HEAD
=======

  def destroy
    @series_item = SeriesItem.find(params[:id])
    @series_item.destroy
    flash[:notice] = "Successfully destroyed series item."
    redirect_to series_items_url
  end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
end
