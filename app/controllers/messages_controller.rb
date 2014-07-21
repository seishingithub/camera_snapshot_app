class MessagesController < ApplicationController

  def index

  end

  def new
    @photo = params[:photo]
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  # DOUBLE-CHECK BEFORE DELETING
  # def create
  #   @message = Message.create(message_params)
  #   if @message.save
  #
  #     redirect_to preview_message_path(@message)
  #   else
  #     render new_message_path
  #   end
  # end

  def create
    @message = Message.create(message_params)
    @photo = params[:photo]
    if @message.save
      if params[:commit] == 'Preview'
        redirect_to preview_message_path(@message, :photo => @photo)  #ADDED @PHOTO HERE
      elsif params[:commit] == 'Send'
        MessageMailer.message_email(@message, @photo).deliver
        # NEED TO CREATE VIEW PAGE FOR SENT MESSAGE
        # PRESENTLY ROUTING TO PREVIEW PAGE
        # 'YOUR CARD WAS SUCCESSFULLY SENT WITH THE
        # FOLLOWING MESSAGE:' (RESEMBLE PREVIEW PAGE)
        redirect_to preview_message_path(@message, :photo => @photo) #ADDED @PHOTO HERE
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
    # need to send email that will increment deliveries length (ActionMailer takes care of the increment)
    redirect_to photo_select_index_path
  end

  private
  def message_params
    params.require(:message).permit(:recipient_name, :recipient_email, :sender_name, :sender_email, :message)
  end

end