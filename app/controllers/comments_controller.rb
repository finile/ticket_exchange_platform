class CommentsController < ApplicationController
   def create
      @ticket = Ticket.find(params[:restaurant_id])
      @comment = @ticket.comments.build(comment_params)
      @comment.user = current_user
      @comment.save!
      redirect_to ticket_path(@ticket)
    end

    def destroy
      @ticket = Ticket.find(params[:ticket_id])
      @comment = Comment.find(params[:id])

      if current_user.admin?
        @comment.destroy
        redirect_to ticket_path(@ticket)
      end
    end


    private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
