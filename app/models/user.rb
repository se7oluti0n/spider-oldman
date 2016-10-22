class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  has_secure_password

  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Message'

  has_many :friendships
  has_many :friends, :through => :friendships

end
