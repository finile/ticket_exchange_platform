class Admin::RailOrdersController < Admin::BaseController  
  def index
    @rail_orders = RailOrder.all.page(params[:page]).per(10)
  end

  def edit
    @rail_order = RailOrder.find(params[:id])
  end

  def update
    @rail_order = RailOrder.find(params[:id])
    if @rail_order.update(rail_order_params)
      if @rail_order.rail_shipping_status == "shipped"
        # UserMailer.notify_order_shipped(@order).deliver_now
      end
      if @rail_order.rail_payment_status == "paid"
        # UserMailer.notify_order_paid(@order).deliver_now
      end
      redirect_to admin_rail_orders_path, notice: "Order updated"
    else
      flash.now[:alert] = @rail_order.errors.full_messages.to_sentence
      render "admin/rail_orders/edit"
    end
  end

  private

  def rail_order_params
    params.require(:rail_order).permit(:payment_status, :shipping_status)
  end
end