class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start, :finish, :is_allday, :memo))
    if @post.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to posts_path
    else
      flash[:notice] = "未入力の項目があります"
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
