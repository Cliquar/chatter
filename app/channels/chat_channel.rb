class ChatChannel < ApplicationCable::Channel
  

  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast "chat_channel", user_on: current_user.id, sendnomsg: true
    current_user.appear
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast "chat_channel", user_off: current_user.id, sendnomsg: true
    current_user.disappear
  end

  def appear
    ActionCable.server.broadcast "chat_channel", user_on: current_user.id, sendnomsg: true
  end

  def disappear
    ActionCable.server.broadcast "chat_channel", user_off: current_user.id, sendnomsg: true
  end

end
