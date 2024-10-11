class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params_comment)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype_id}"
    else
      @prototype = Prototype.find(params[:id])
      render 'prototypes/show', status: :unprocessable_entity
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
