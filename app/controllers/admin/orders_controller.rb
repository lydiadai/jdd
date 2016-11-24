class Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_admin
    layout 'admin'
    def index
        @orders = Order.order('id DESC')
    end

    def show
        @order = Order.find_by_token(params[:id])
        @product_lists = @order.product_lists
    end

    def ship
        @order = Order.find(params[:id])
        @order.ship!
        OrderMailer.notify_ship(@order).deliver!
        redirect_to :back
    end

    def shipped
        @order = Order.find(params[:id])
        @order.deliver!
        redirect_to :back
    end

    def cancel
        @order = Order.find(params[:id])
        @order.cancel_order!
        OrderMailer.notify_cancel(@order).deliver!
    end

    def return
        @order = Order.find(params[:id])
        @order.return_good!
        redirect_to :back
    end

    private

    def order_params
        params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
    end
end
