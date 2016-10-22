class MessagesController < ApplicationController
  before_action :require_user!
  
  def index
    @received_messages = current_user.received_messages.order("created_at DESC")
  end

  def new
    @user = User.find params[:user_id]
    @message = Message.new
  end

  def create
    @user = User.find params[:user_id] 
    @message = @user.sent_messages.create message_params

    if @message.save
      flash[:success] = "Message sent"     
      redirect_to user_messages_path(@user)
    else
      flash[:error] = "Sent failed"
    end

  end
  def show
    @message = Message.where(id: params[:id], recipient_id: current_user.id).first
    if @message and not @message.seen?
      @message.seen_at = Time.now
      @message.save
    else
      @message = nil
    end
  end

  def list_sent_messages
    @sent_messages = current_user.sent_messages.order("created_at DESC")
  end

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
end
