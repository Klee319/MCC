class TalkBroadcastJob < ApplicationJob
  queue_as :default
  def perform(talk, action)
    ActionCable.server.broadcast('talk_channel', { action: action, talk: render_message(talk), talk_id: talk.id  })
  end

  private

  def render_message(talk)
    ApplicationController.renderer.render(partial: 'talks/talk', locals: { talk: talk })
  end
end