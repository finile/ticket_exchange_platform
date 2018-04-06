class Admin::UsersController < Admin::BaseController

  def index
    # @users = User.order(created_at: :desc).page(params[:page]).per(10)

    @ransack = User.ransack(params[:q])
    @users = @ransack.result
    
  end

end
