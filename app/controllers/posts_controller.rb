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
      flash[:notice] = "内容に不備があります"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start, :finish, :is_allday, :memo))
      flash[:notice] = "内容を更新しました"
      redirect_to posts_path
    else
      flash[:notice] = "内容に不備があります"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to posts_path
  end
end
