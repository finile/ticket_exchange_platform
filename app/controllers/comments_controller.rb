class CommentsController < ApplicationController

    def create
      # @ticket = Ticket.find(params[:ticket_id])
      # @comment = @ticket.comments.build(comment_params)
      # @comment.user = current_user
      # @comment.save!
      # redirect_to ticket_path(@ticket)

      if params[:ticket_id]
          @commentable = Ticket.find(params[:ticket_id])
      elsif params[:coupon_id]
          @commentable = Coupon.find(params[:coupon_id])
      elsif params[:railticket_id]
          @commentable = Railticket.find(params[:railticket_id])
      end

       @comment = @commentable.comments.build(comment_params) 
       @comment.user = current_user
       @comment.save
       redirect_to @commentable, notice: "your comment was sucessfully posted"
    end


    def destroy
      if params[:ticket_id]
        @ticket = Ticket.find(params[:ticket_id])
        @comment = Comment.find(params[:id])
        if current_user.admin?
          @comment.destroy
          redirect_to ticket_path(@ticket)
        end
      elsif params[:coupon_id]
        @coupon = Coupon.find(params[:coupon_id])
        @comment = Comment.find(params[:id])
        if current_user.admin?
          @comment.destroy
          redirect_to coupon_path(@coupon)
        end
      elsif params[:railticket_id]
        @railticket = Railticket.find(params[:railticket_id])
        @comment = Comment.find(params[:id])
        if current_user.admin?
          @comment.destroy
          redirect_to railticket_path(@railticket)
        end
      end
    end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
