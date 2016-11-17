class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_admin
    layout 'admin'
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:notice] = '添加成功'
            redirect_to admin_products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_products_path, notice: '商品修改成功'
        else
            render :edit
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path
        flash[:alert] = '商品成功删除'
    end

    def publish
        @product = Product.find(params[:id])
        @product.publish!
        redirect_to admin_products_path
    end

    def hide
        @product = Product.find(params[:id])
        @product.hide!
        redirect_to admin_products_path
    end

    private

    def product_params
        params.require(:product).permit(:title, :description, :quantity, :price, :is_hidden, :image)
    end
end
