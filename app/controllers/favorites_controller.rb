class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:form_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    FormBroadcastJob.perform_later(post, 'create',current_user)
  end

  def destroy
    post = Post.find(params[:form_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    FormBroadcastJob.perform_later(post, 'destroy',current_user)
  end


end
