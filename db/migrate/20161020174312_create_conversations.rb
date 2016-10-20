class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :recipient_email

      t.timestamps
    end
  end
end
