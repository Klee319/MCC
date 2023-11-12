class FormsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    puts @post
    @post.user = current_user
    if @post.save
      redirect_to form_path(@post.id)
    else
      render :new
    end
  end

  def index
    @post = Post.new
    @posts=Post.all.reverse_order
    #@posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new # この行を追記
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
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
      redirect_to form_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/forms'
  end

  def default_url
    'sample.jpg'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image_id, :image_id_cache, :user_id,image: [])
  end

end
