class LocationsController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]
  layout 'locations', :except => [:auto_complete_for_search_query]
  
  def auto_complete_for_search_query
    # look for autosuggest results in memcached
    unless read_fragment({:query => params["search"]["query"]}) 
      @locations = Location.name_like params["search"]["query"]
    end
    render :partial => "search_results"
  end
  
  # GET /locations
  # GET /locations.xml
  def index
    # @locations = Location.all
    if params[:search]
      @locations = Location.name_sounds_like(params["search"]["query"]).paginate(:page => params[:page], :order => 'population DESC')  
    else    
      @locations = Location.paginate(:page => params[:page], :order => 'population DESC', :per_page => 12)   
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # # GET /locations/new
  # # GET /locations/new.xml
  # def new
  #   @location = Location.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @location }
  #   end
  # end
  # 
  # # GET /locations/1/edit
  # def edit
  #   @location = Location.find(params[:id])
  # end
  # 
  # # POST /locations
  # # POST /locations.xml
  # def create
  #   @location = Location.new(params[:location])
  # 
  #   respond_to do |format|
  #     if @location.save
  #       flash[:notice] = 'Location was successfully created.'
  #       format.html { redirect_to(@location) }
  #       format.xml  { render :xml => @location, :status => :created, :location => @location }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # PUT /locations/1
  # # PUT /locations/1.xml
  # def update
  #   @location = Location.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @location.update_attributes(params[:location])
  #       flash[:notice] = 'Location was successfully updated.'
  #       format.html { redirect_to(@location) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /locations/1
  # # DELETE /locations/1.xml
  # def destroy
  #   @location = Location.find(params[:id])
  #   @location.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(locations_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
