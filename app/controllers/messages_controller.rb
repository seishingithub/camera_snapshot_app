class MessagesController < ApplicationController

  def index

  end

  def new #(photo)
    #@photo = photo
    @message = Message.new
  end

end