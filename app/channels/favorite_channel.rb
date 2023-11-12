class FavoriteChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'favorite_channel'
    puts("subscribed")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    ActionCable.server.broadcast('favorite_channel', {post: data['post']})
  end
end
