class PhotoUpload < ActiveRecord::Base

  mount_uploader :name, S3PhotoUploader

end