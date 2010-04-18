class IdentitiesController < ApplicationController

  before_filter :require_user


  # GET /identities
  # GET /identities.xml
  def index
    @identities = current_user.identities.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @identities }
    end
  end

  # GET /identities/1
  # GET /identities/1.xml
  def show
    @identity = current_user.identities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  # GET /identities/new
  # GET /identities/new.xml
  def new
    @identity = Identity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @identity }
    end
  end

  # GET /identities/1/edit
  def edit
    @identity = current_user.identities.find(params[:id])
  end

  # POST /identities
  # POST /identities.xml
  def create
    @identity = current_user.identities.new(params[:identity])

    respond_to do |format|
      if @identity.save
        flash[:notice] = 'Identity was successfully created.'
        format.html { redirect_to :controller => "identities",:action => "index"}
        #format.xml  { render :xml => @identity, :status => :created, :location => @identity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /identities/1
  # PUT /identities/1.xml
  def update
    @identity = current_user.identities.find(params[:id])

    respond_to do |format|
      if @identity.update_attributes(params[:identity])
        flash[:notice] = 'Identity was successfully updated.'
        format.html { redirect_to(@identity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @identity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /identities/1
  # DELETE /identities/1.xml
  def destroy
    @identity = current_user.identities.find(params[:id])
    @identity.destroy

    respond_to do |format|
      format.html { redirect_to(identities_url) }
      format.xml  { head :ok }
    end
  end
end
