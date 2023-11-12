class StorylineBroadcastJob < ApplicationJob
  queue_as :default

  def perform(storyline, action)
    ActionCable.server.broadcast 'storyline_channel',{action: action, storyline: render_message(storyline), storyline_id: storyline.id}
  end

  private

  def render_message(storyline)
    ApplicationController.renderer.render(partial: 'storylines/storyline', locals: { storyline: storyline })
  end
end
