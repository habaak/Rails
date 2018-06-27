class PostsController < ApplicationController
  #intercepter
  before_action :authorize, except: :index

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    post=Post.create(title: params[:title], content: params[:content], username: params[:username])
    flash[:notice] = "글이 작성되었습니다."
    redirect_to "/posts/#{post.id}"
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post=Post.find(params[:id])
    post.update(title: params[:title], content: params[:content]) # return 값이 true / false
    flash[:notice] = "글이 수정되었습니다."
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "글이 삭제 되었습니다."
    redirect_to '/'
  end
end
