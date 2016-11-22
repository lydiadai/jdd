class OrderMailer < ApplicationMailer
    def notify_order_placed(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: @user.email, subject: '［JDD store］感谢您完成此次购物，以下是您的购物明细 #{order.token}')
    end
end
