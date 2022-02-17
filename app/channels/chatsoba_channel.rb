class ChatsobaChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chatsoba_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
