class FriendshipsController < ApplicationController
  def create
    @user = User.find params[:user_id]
    
    @friendship = @user.friendships.create friendship_params
    
    if @friendship.save
      flash[:success] = "Successfully add friend"
    else
      raise "aa"
      flash[:error] = "Add friend failed"
    end
    redirect_to users_path
  end

  def friendship_params
    params.permit(:friend_id)
  end
end
