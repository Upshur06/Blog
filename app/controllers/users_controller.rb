class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/"
    else
      render "/users/new"
    end
  end

def signin
    @user = User.find_by_username(params[:username])
    if current_user && current_user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
      flash[:notice] = "succesfully signed in"
    else
      redirect_to :controller => "sessions", :action => "new"
      flash[:notice] = "try again"
    end
end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      refirect_to "/users"
    else
      render edit_user_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
      redirect_to "/"
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end
end
