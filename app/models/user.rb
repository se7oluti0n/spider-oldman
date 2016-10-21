class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  has_secure_password

  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'

end
