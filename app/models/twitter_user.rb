class TwitterUser < ActiveRecord::Base
  has_many :tweets

  # def self.find_or_create_user(username)
  #   TwitterUser.find_by_username(username) ||= TwitterUser.create(username: username)
  # end
  # Remember to create a migration!
end
