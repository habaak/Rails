class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :updata, :destroy]

  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    flash[:notice] = "새로운 글이 작성되었습니다."

    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)

    flash[:notice] = "글이 수정되었습니다"

    redirect_to '/'
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    flash["alert"] = "글이 삭제되었습니다"

   redirect_to '/'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
     #params를 받을 때 title과 content만 허가해준
     params.permit(:title, :content)
 end

end
