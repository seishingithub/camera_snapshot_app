class Messages < ApplicationController

  def new(photo)
    @photo = photo
    @message = Message.new
  end

  def create

  end

end