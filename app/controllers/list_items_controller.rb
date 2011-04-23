class ListItemsController < ApplicationController
  before_filter :login_required
  def index
    @list_items = current_user.list_items
  end

  def show
    @list_item = ListItem.find(params[:id])
  end

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

  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy
    flash[:notice] = "Successfully destroyed list item."
    redirect_to :back
  end
end
