class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: :index  # Login 검증
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
    # @posts = Post.all.reverse
    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        # flash[:notice] = "글 작성이 완료되었습니다."
        # redirect_to '/'
        format.html {redirect_to "/", notice: '글 작성이 완료되었습니다.'} # html 형식으로 정형화해서 응답한다.
      else
        # flash[:alert] = "제목이나 내용을 입력해주세요"
        # redirect_to new_post_path
        format.html {render :new}
        format.json {render json: @post.errors}
      end
    end
  end

  def show
    @comments = @post.comments
  end

  def edit
    # if current_user.id == @post.user.id
    # else
    #   redirect_to '/'
    # end
  end

  def update
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
