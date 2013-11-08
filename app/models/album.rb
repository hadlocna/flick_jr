class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  # Remember to create a migration!
end
