class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_vip
    layout 'admin'
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
        @photo = @product.photos.build
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            if params[:photos] != nil?
                params[:photos]['avatar'].each do |a|
                    @photo = @product.photos.create(avatar: a)
                end
            end
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
        if  params[:photos] != nil?
            @product.photos.destroy_all
            params[:photos]['avatar'].each do |a|
                @picture = @product.photos.create(avatar: a)
            end

            @product.update(product_params)
            redirect_to admin_products_path, notice: '商品修改成功'
        elsif @product.update(product_params)
            redirect_to admin_products_path, notice: '商品修改成功'
        else
            render :edit
        end
    end

    def show
        @product = Product.find(params[:id])
        @photos = @product.photos.all
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
