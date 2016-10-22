class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "User #{user_params[:email]} was sucessfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @users = User.where("id != #{current_user.id}")
  end

  def show
    @sent_messages = current_user.sent_messages.order("created_at DESC")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
