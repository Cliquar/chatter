class ChatroomController < ApplicationController
  def show
    @messages = Message.all
    @message = Message.new
    @users = User.all
  end
end
