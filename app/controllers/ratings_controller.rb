class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.xml
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.xml
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  def create
    @rating = Rating.new(params[:rating])
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.xml
  # def create
  #   @rating = Rating.new(params[:rating])
  # 
  #   respond_to do |format|
  #     if @rating.save
  #       format.html { redirect_to(@rating, :notice => 'Rating was successfully created.') }
  #       format.xml  { render :xml => @rating, :status => :created, :location => @rating }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  
  def create
    @rating = Rating.new(params[:rating])
    @rating.user_id = current_user.id
  	@rating.save!
    respond_to do |format|
      if @rating.save
        flash[:notice] = 'Rating was successfully created.'
        format.html { redirect_to :controller => :episodes, :action => 'show', :id => @rating.episode_id }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to(@rating, :notice => 'Rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end
end
