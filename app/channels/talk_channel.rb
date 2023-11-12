class TalkChannel < ApplicationCable::Channel
  def subscribed
     stream_from "talk_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
