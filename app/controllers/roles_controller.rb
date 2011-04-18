class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

<<<<<<< HEAD
=======
  def new
    @role = Role.new
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:notice] = "Successfully created role."
      redirect_to @role
    else
      render :action => 'new'
    end
  end

<<<<<<< HEAD
=======
  def edit
    @role = Role.find(params[:id])
  end

>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      flash[:notice] = "Successfully updated role."
      redirect_to @role
    else
      render :action => 'edit'
    end
  end
<<<<<<< HEAD
=======

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully destroyed role."
    redirect_to roles_url
  end
>>>>>>> 8854265e33a116c6e390f666c01b12253fb524c4
end
