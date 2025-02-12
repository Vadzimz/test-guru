class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
  
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:url_before_auth]
      cookies[:url_before_auth] = nil
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path, status: :see_other
  end

end
