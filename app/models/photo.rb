class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :file, Uploader
  # Remember to create a migration!
end
