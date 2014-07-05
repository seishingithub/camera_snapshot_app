class Message < ActiveRecord::Base
  has_one :user
  has_one :photo
end
