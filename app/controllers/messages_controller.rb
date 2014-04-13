class MessagesController < ApplicationController

  def index
    @recieved_messages = current_user.recieved_messages
    @sent_messages = current_user.sent_messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :back, notice: "Successfully"
    else
      redirect_to :back, notice: "Wrong"
    end
  end

  def destroy
  end

  def read_messages
    @message = Message.find(params[:id])
    @message.update_attributes(read_param)
    redirect_to :back
  end

  def update
    @message = Message.find(params[:id])
    @message.update_attributes(read_param)
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:content, :theme, :sender_id, :recipient_id)
  end

  def read_param
    params.require(:message).permit(:read)
  end

end