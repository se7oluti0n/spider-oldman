class ConversationsController < ApplicationController
  def new
    @conversation = Conversation.new
  end


  def create
    if Conversation.have_conversation(conversation_params[:sender_id], conversation_params[:recipient_id])
      @conversation = Conversation.have_conversation(conversation_params[:sender_id], conversation_params[:recipient_id]).first

    else
      @conversation = Conversation.new conversation_params
      if @conversation.save

      else


      end
    end
  end

  def conversation_params
    params[:conversation].permit(:sender_id, :recipient_id)
  end
end
