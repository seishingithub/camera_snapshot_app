class Message < ActiveRecord::Base
  has_one :user
  has_one :photo
  validates :sender_email, presence: true
  validates :recipient_email, presence: true
  validates :message, presence: true
  validates_format_of :sender_email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates_format_of :recipient_email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
end