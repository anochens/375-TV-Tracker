class ListItemsController < ApplicationController
  before_filter :login_required
  def index
    @list_items = current_user.list_items
  end

  def show
    @list_item = ListItem.find(params[:id])
  end

  def new
    @list_item = ListItem.new
  end

  def create
    params[:list_item][:user_id] = current_user.id
    @list_item = ListItem.new(params[:list_item])
    if @list_item.save
      flash[:notice] = "Successfully created list item."
      redirect_to list_items_url
    else
      render :action => 'new'
    end
  end

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

  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    flash[:notice] = "Successfully destroyed list item."
    redirect_to list_items_url
  end
end
