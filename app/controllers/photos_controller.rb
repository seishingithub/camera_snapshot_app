class PhotosController < ApplicationController

  def create
    uploader = S3PhotoUploader.new
    p uploader.store!(params[:image][:file])

    redirect_to new_message_path
  end

end
