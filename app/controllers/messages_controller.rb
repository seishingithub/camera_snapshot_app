class MessagesController < ApplicationController

  def index

  end

  def new
    @photo = params[:photo]
    @message = Message.new
  end

  def create
    if params[:commit] == 'Cancel'
      redirect_to photo_select_index_path
      flash[:notice] = "Your eCard has been cancelled"
    elsif params[:commit] == 'Preview'
      @message = Message.new(message_params)
      @photo = params[:photo]
      if @message.save
        redirect_to preview_message_path(@message, :photo => @photo)
      else
        @errors = @message.errors.messages
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
    if params[:commit] == 'Cancel'
      redirect_to photo_select_index_path
      flash[:notice] = "Your eCard has been cancelled"
    elsif params[:commit] == 'Preview'
      @message = Message.find(params[:id])
      @photo = params[:photo]
      if @message.update(message_params)
        redirect_to preview_message_path(@message, :photo => @photo)
      else
        @errors = @message.errors.messages
        render new_message_path
      end
    end
  end

  def destroy
    @message = Message.find(params[:id]).destroy
    redirect_to photo_select_index_path
    flash[:notice] = "Your eCard has been cancelled"
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
    flash[:notice] = "Your eCard has been sent!"
  end

  private
  def message_params
    params.require(:message).permit(:recipient_name, :recipient_email, :sender_name, :sender_email, :message)
  end

end