class OrderMailer < ApplicationMailer
    def notify_order_placed(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: @user.email, subject: "[JDD store］感谢您完成此次购物，以下是您的购物明细 #{order.token}")
    end

    def notify_order_placed(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: @user.email, subject: "［JDD store］感谢您完成此次购物，以下是您的购物明细 #{order.token}")
    end

    def notify_cancel(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: @user.email, subject: "［JDD store］您已取消订单 #{order.token}")
    end

    def notify_ship(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: @user.email, subject: "［JDD store］您的订单已发货 #{order.token}")
    end

    def notify_apply_cancel(order)
        @order = order
        @user = order.user
        @product_lists = @order.product_lists
        mail(to: '1234@kl.com', subject: "[JDD store]用户#{order.user.email} 申请取消订单 #{order.token}")
    end
end
