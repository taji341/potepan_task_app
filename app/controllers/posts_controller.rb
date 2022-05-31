class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :post_memo))
    if @post.save 
      flash[:notice] = "スケジュールを登録しました"
      redirect_to "/posts"
    else
      render new_post_path,status: :unprocessable_entity
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
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :post_memo))
      flash[:notice] = "スケジュールを編集しました"
      redirect_to "/posts"
    else
      render "edit",status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to "/posts",status: :see_other
  end
end
