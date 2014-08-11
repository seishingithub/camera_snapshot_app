class PhotoUploadsController < ApplicationController

  def create
    uploader = S3PhotoUploader.new
    uploader.store!(params[:photo_upload][:name])

    # upload file to aws
    # get back url to photo
    # save url as instance variable to pass to view
    redirect_to new_message_path
  end

  def index
    @photo_uploads = PhotoUpload.all
  end

end