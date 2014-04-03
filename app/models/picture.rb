class Picture < ActiveRecord::Base
  belongs_to :ticket

  mount_uploader :file, PictureUploader
end
