class ListItemsController < ApplicationController
  before_filter :login_required
  def index
    @list_items = current_user.list_items
  end

  def show
    @list_item = ListItem.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @list_item = ListItem.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    params[:list_item][:user_id] = current_user.id
    @list_item = ListItem.new(params[:list_item])
    if @list_item.save
      flash[:notice] = "Successfully created list item."
      redirect_to :back
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @list_item = ListItem.find(params[:id])
  end

  def update
    @list_item = ListItem.find(params[:id])
    params[:list_item][:user_id] = current_user.id
    if @list_item.update_attributes(params[:list_item])
      flash[:notice] = "Successfully updated list item."
      redirect_to list_items_url
    else
      render :action => 'edit'
    end
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    flash[:notice] = "Successfully destroyed list item."
    redirect_to :back
  end
end
