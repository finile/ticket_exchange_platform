class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_cart
  helper_method :current_rail_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def current_cart
    @cart || set_cart
  end

  def set_cart

    if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end

    @cart ||= Cart.create

    session[:cart_id] = @cart.id
    @cart
  end

  def current_rail_cart
    @rail_cart || set_rail_cart
  end

  def set_rail_cart

    if session[:rail_cart_id]
      @rail_cart = RailCart.find_by(id: session[:rail_cart_id])
    end

    @rail_cart ||= RailCart.create

    session[:rail_cart_id] = @rail_cart.id
    @rail_cart
  end

end
  