class SessionsController < ApplicationController
  def new
    @user = current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
