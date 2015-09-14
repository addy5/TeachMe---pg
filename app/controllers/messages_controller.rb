class MessagesController < ApplicationController
  # def index
  #   @messages = Message.all
  # end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
      flash[:newUser] = "Message was sent successfully"
    else
      render "/messages/new"
      flash[:notice] = "Error occured, message was not sent"
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :phone, :subject, :message)
    end

end
