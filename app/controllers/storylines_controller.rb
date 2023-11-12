class StorylinesController < ApplicationController
  def new
    @post = Storyline.new
  end

  def create
    @post = Storyline.new(create_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      StorylineBroadcastJob.perform_later(@post, 'create')
      Talkroom.create(storyline_id: @post.id, user_id: current_user.id)
      redirect_to storyline_path(@post.id)
    else
      # Output errors for debugging purposes
      puts @post.errors.full_messages

      # Handle the case where the object is not valid and rendering the form again
      render :new
    end

  end

  def index
    @post = Storyline.all
    @posts = Storyline.page(params[:page]).reverse_order
  end

  def show
    storyline = Storyline.find(params[:id])
    if storyline.private == true
      if storyline.users.include?(current_user)
        @user = storyline.users
        @post = Storyline.find(params[:id])
        @comments = Talk.where(storyline_id: params[:id])
      else
        redirect_to "/storylines"
      end
    else
      @user = storyline.users
      @post = Storyline.find(params[:id])
      @comments = Talk.where(storyline_id: params[:id])
    end

  end

  def edit
    if current_user.id == Storyline.find(params[:id]).user_id
      # トークルームに所属しているユーザーを返す
      @post = Storyline.find(params[:id])
      @user = @post.users
    else
      redirect_to "/storylines/#{params[:id]}"
    end
  end

  def update
    @post = Storyline.find(params[:id])
    @post.update(create_params)
    StorylineBroadcastJob.perform_later(@post, 'update')
    redirect_to storyline_path(@post.id)
  end

  def destroy
    post = Storyline.find(params[:id])
    post.destroy
    StorylineBroadcastJob.perform_later(post, 'update')
    redirect_to '/storylines'
  end

  def add_user_view
    @post = Storyline.find(params[:storyline_id])
    @user = current_user.followers
    @users = @post.users
    @add_user = AddUser.new
  end

  def add_user
    users = params.require(:add_user)
    users.each do |key, value|
      if users[key] == "0" && Storyline.find(params[:storyline_id]).users.include?(User.find(key))
        Storyline.find(params[:storyline_id]).users.delete(User.find(key))
      elsif users[key] == "1" && !Storyline.find(params[:storyline_id]).users.include?(User.find(key))
        Storyline.find(params[:storyline_id]).users << User.find(key)

      end
    end
    redirect_to "/storylines/#{params[:storyline_id]}"

  end

  private

  def create_params
    params.require(:storyline).permit(:title, :subject, :image, :user_id, :private)
  end

end
