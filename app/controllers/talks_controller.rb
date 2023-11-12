class TalksController < ApplicationController
  def new
    @post = Talk.new

  end

  def create

    @post = Talk.new(create_params)
    @post.user = current_user
    @post.storyline_id = (params[:storyline_id])
    @post.save
    TalkBroadcastJob.perform_later(@post, 'create')
    #redirect_to storyline_path(@post.storyline_id)
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Storyline.find(params[:id])
  end

  def edit
    if current_user.id == Post.find(params[:id]).user_id
      @post = Post.find(params[:id])
    else
      redirect_to "/forms/#{params[:id]}"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      TalkBroadcastJob.perform_later(@post, 'update')
      redirect_to form_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    TalkBroadcastJob.perform_later(post, 'update')
    redirect_to '/forms'
  end

  def default_url
    'sample.jpg'
  end

  private

  def create_params
    params.require(:talk).permit(:message, :mention_user, :image, :storyline_id, :user_id)
  end

end
