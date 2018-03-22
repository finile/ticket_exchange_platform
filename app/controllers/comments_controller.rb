class CommentsController < ApplicationController

    def create
      @ticket = Ticket.find(params[:ticket_id])
      @comment = @ticket.comments.build(comment_params)
      @comment.user = current_user
      @comment.save!
      redirect_to ticket_path(@ticket)
    end

    # def create
    #   comment = Comment.new(comment_params)
    #   if comment.save
    #     UserMailer.notify_comment(current_user, comment).deliver_later!
    #     redirect_to comments_path
    #   else
    #     render :action => :new
    #   end
    # end


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
