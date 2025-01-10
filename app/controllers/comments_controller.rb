class CommentsController < ApplicationController

  def create
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to prototype_path(@comment.prototype)
      else
        # @prototype と @comments を設定してからレンダーを呼び出す
        @prototype = Prototype.find(params[:prototype_id])
        @comments = @prototype.comments.includes(:user)
        render "prototypes/show"
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
