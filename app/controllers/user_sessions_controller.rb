class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  ssl_required :new, :create, :destroy if Rails.env.production?
  ssl_allowed :index if Rails.env.production?

  def index
    redirect_back_or_default :controller => "application",:action => "index"
  end

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_back_or_default :controller => "identities",:action => "index"
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_back_or_default root_url
  end
end
