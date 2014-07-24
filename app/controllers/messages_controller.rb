class MessagesController < ApplicationController

  def index

  end

  def new
    @photo = params[:photo]
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    @photo = params[:photo]
    if @message.save
      if params[:commit] == 'Preview'
        redirect_to preview_message_path(@message, :photo => @photo)
      elsif params[:commit] == 'Cancel'
        redirect_to photo_select_index_path
        flash[:notice] = "Your eCard has been cancelled"
      else
        render new_message_path
      end
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @photo = params[:photo]
    @message = Message.find(params[:id])
    render :new
  end

  def update
    @message = Message.find(params[:id])
    @message.update!(message_params)
    @photo = params[:photo]
    if @message.save
      if params[:commit] == 'Preview'
        redirect_to preview_message_path(@message, :photo => @photo)
      elsif params[:commit] == 'Cancel'
        redirect_to photo_select_index_path
        flash[:notice] = "Your eCard has been cancelled"
      else
        render new_message_path
      end
    end
  end

  def preview
    @photo = params[:photo]
    @message = Message.find(params[:id])
  end

  def deliver
    @photo = params[:photo]
    @message = Message.find(params[:id])
    MessageMailer.message_email(@message, @photo).deliver
    redirect_to photo_select_index_path
  end

  private
  def message_params
    params.require(:message).permit(:recipient_name, :recipient_email, :sender_name, :sender_email, :message)
  end

end