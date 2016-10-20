class Conversation < ApplicationRecord
  helper_methods :have_conversation
  def have_conversation(sender_id, recipient_id)
    Conversation.where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end 
end
