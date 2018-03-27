class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
      @order = current_user.orders.new(order_params)
      @order.sn = Time.now.to_i
      @order.add_order_items(current_cart)
      @order.amount = current_cart.subtotal
      if @order.save
        current_cart.destroy
        redirect_to orders_path, notice: "new order created"
      else
        @items = current_cart.cart_items
        render "carts/show"
      end
  end

   def update
    @order = current_user.orders.find(params[:id])
    if @order.shipping_status == "not_shipped"
      @order.shipping_status = "cancelled"
      @order.save
      redirect_to orders_path, alert: "order##{@order.sn} cancelled."
    end
  end


  def checkout_spgateway
    @order = current_user.orders.find(params[:id])
    if @order.payment_status != "not_paid"
      flash[:alert] = "Order has been paid."
      redirect_to orders_path
    else
      @payment = Payment.create!(
        sn: Time.now.to_i,
        order_id: @order.id,
        amount: @order.amount
      )

       spgateway_data = {
        MerchantID: "MS33487888",
        Version: 1.4,
        RespondType: "JSON",
        TimeStamp: Time.now.to_i,
        MerchantOrderNo: "#{@payment.id}AC",
        Amt: @order.amount,
        ItemDesc: @order.name,
        ReturnURL: spgateway_return_url,
        Email: @order.user.email,
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

  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method)
  end
end