class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js {render 'create_temp'}
      end
    else
      redirect_to :back
    end
  end
end
