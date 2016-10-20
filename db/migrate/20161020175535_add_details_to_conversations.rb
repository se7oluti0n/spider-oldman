class AddDetailsToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :unread_sender, :integer, default: 0
    add_column :conversations, :unread_recipient, :integer, default: 0
  end
end
