class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:form_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to form_path(@post)
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments.page(params[:page]).per(7).reverse_order
      render 'forms/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:form_id]).destroy
    redirect_to form_path(params[:form_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
