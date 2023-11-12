class FormBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post, action, current_user)
    ActionCable.server.broadcast('favorite_channel', { action: action, post: render_message(post, current_user), post_id: post.id })
  end

  private

  def render_message(post, user)
    ApplicationController.render_with_signed_in_user(user, partial: 'posts/post', locals: { post: post })
  end
end

