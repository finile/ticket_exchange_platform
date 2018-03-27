class RailOrdersController < ApplicationController
  
  def index
    @rail_orders = current_user.rail_orders.order(created_at: :desc)
  end

  def create
      @rail_order = current_user.rail_orders.new(rail_order_params)
      @rail_order.sn = Time.now.to_i
      @rail_order.add_rail_order_items(current_rail_cart)
      @rail_order.amount = current_rail_cart.subtotal
      if @rail_order.save
        current_rail_cart.destroy
        redirect_to rail_orders_path, notice: "new order created"
      else
        @rail_items = current_rail_cart.rail_cart_items
        render "rail_carts/show"
      end
  end

   def update
    @rail_order = current_user.rail_orders.find(params[:id])
    if @rail_order.rail_shipping_status == "not_shipped"
      @rail_order.rail_shipping_status = "cancelled"
      @rail_order.save
      redirect_to rail_orders_path, alert: "order##{@rail_order.sn} cancelled."
    end
  end

  def checkout_spgateway1
    @rail_order = current_user.rail_orders.find(params[:id])
    if @rail_order.rail_payment_status != "not_paid"
      flash[:alert] = "Order has been paid."
      redirect_to rail_orders_path
    else
      @payment = Payment.create!(
        sn: Time.now.to_i,
        rail_order_id: @rail_order.id,
        amount: @rail_order.amount
      )

       spgateway_data = {
        MerchantID: "MS33487888",
        Version: 1.4,
        RespondType: "JSON",
        TimeStamp: Time.now.to_i,
        MerchantOrderNo: "#{@payment.id}AC",
        Amt: @rail_order.amount,
        ItemDesc: @rail_order.name,
        ReturnURL: spgateway1_return_url,
        Email: @rail_order.user.email,
        LoginType: 0
      }.to_query

      hash_key = "TYiU1DmujbmURuMe0Htc6sep2Er4xD0L"
      hash_iv = "JhTNuxOHK7jDcZQQ"

      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = hash_key
      cipher.iv  = hash_iv
      encrypted = cipher.update(spgateway_data) + cipher.final
      aes = encrypted.unpack('H*').first

      str = "HashKey=#{hash_key}&#{aes}&HashIV=#{hash_iv}"
      sha = Digest::SHA256.hexdigest(str).upcase

      @merchant_id = "MS33487888"
      @trade_info = aes
      @trade_sha = sha
      @version = "1.4"


      render layout: false
    end
  end

  private

  def rail_order_params
    params.require(:rail_order).permit(:name, :phone, :address, :payment_method)
  end
end