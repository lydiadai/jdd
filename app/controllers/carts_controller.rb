class CartsController < ApplicationController
    before_action :authenticate_user!, only: [:checkout]
    def index
        @carts = Cart.all
    end

    def show
        @cart = Cart.find(params[:id])
    end

    def new
        @cart = Cart.new
    end

    def clean
        current_cart.clean!
        flash[:warning] = '已清空购物车'
        redirect_to carts_path
    end

    def checkout
        @order = Order.new
    end
end
