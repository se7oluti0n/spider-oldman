class MessagesController < ApplicationController
    before_action :require_user!
  def new
    @user = User.find params[:user_id]
    @message = Message.new
  end

  def create
    @user = User.find params[:user_id] 
    @message = @user.sent_messages.create message_params

    if @message.save
      flash[:success] = "Message sent"     
      redirect_to users_path(@user)
    else
      flash[:error] = "Sent failed"
    end

  end
  def show
    @message = Message.where(id: params[:id], recipient_id: current_user.id)
    if @messages and not @message.seen?
      @message.seen_at = Time.now
      @message.save!
    end
  end

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
end
