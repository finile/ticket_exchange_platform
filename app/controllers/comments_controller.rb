class CommentsController < ApplicationController
  
  def create
    if params[:ticket_id]
        @commentable = Ticket.find(params[:ticket_id])
    elsif params[:coupon_id]
        @commentable = Coupon.find(params[:coupon_id])
    elsif params[:railticket_id]
        @commentable = Railticket.find(params[:railticket_id])
    elsif params[:comboard_id]
        @commentable = Comboard.find(params[:comboard_id])
    end
    
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      UserMailer.notify_buyer(@comment).deliver_now!
    end
    redirect_to @commentable, notice: "your comment was sucessfully posted and notice has been sent"
    
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
    elsif params[:comboard_id]
      @comboard = Comboard.find(params[:comboard_id])
      @comment = Comment.find(params[:id])
      if current_user.admin?
        @comment.destroy
        redirect_to comboard_path(@comboard)
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
