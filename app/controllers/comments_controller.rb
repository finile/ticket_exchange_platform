class CommentsController < ApplicationController
  def create
      @ticket = Ticket.find(params[:restaurant_id])
      @comment = @ticket.comments.build(comment_params)
      @comment.user = current_user
      @comment.save!
      redirect_to ticket_path(@ticket)
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
