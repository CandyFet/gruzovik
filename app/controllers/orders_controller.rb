class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create

    if @cart.order.present?
      @order = @cart.order
      @order.attributes = order_params
    else
      @order = Order.new(order_params)
    end

    if @order.save

      @order.cart = @cart

      session.delete(:cart_id)

      Notify.new_order(@order).deliver_later
      Notify.new_order_to_user(@order).deliver_later if @order.email?

    else

      render :new

    end

  end

  private

  def order_params
    params.require(:order).permit(:person, :name, :company, :post, :company_details, :email, :phone, :comments,
                                  :delivery, :payment, :file, :file_cache)
  end
end
