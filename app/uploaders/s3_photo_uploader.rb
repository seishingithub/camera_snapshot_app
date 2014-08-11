# encoding: utf-8

class S3PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  def store_dir
    #"uploads/#{photo_upload.class.to_s.underscore}/#{mounted_as}/#{photo_upload.id}"
    "uploads/"
  end

end
