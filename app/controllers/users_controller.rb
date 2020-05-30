class UsersController < ApplicationController

def index

  @users = User.all

end

def new

  @user = User.new

end

def create

  @user = User.new(form_params)

  if @user.save

    session[:user_id] = @user.id

    redirect_to users_path
  else
    render "new"
  end

end

def show

  @user = User.find_by(username: params[:id])

end

def form_params

    params.require(:user).permit(:username, :password, :password_confirmation, :email)

end


end
