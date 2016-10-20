class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]

    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome back #{@user.name}"
        redirect_to users_show_path
      else
        flash[:error] = "Password is not correct!"
      end 
    else
      flash[:error] = "Sorry, user not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logout"
    redirect_to root_path
  end
end
