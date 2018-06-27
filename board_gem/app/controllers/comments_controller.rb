class CommentsController < ApplicationController
  def create
    @comments = Post.find(params[:post_id]).comments.new(comment_params)
    @comments.save
    flash[:notice] = "새로운 뎃글이 작성되었습니다"
    redirect_to :back
  end

  def new

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def comment_params
     #params를 받을 때 title과 content만 허가해준
     params.permit(:content, :post_id)
 end
end
