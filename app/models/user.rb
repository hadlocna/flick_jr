class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, through: :albums
  # Remember to create a migration!
end
