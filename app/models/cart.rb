# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, through: :cart_items, source: :product
    def add_product_to_cart(product)
        cart_item = cart_items.build
        cart_item.product = product
        cart_item.quantity = 1
        cart_item.save
    end

    def total_price
        sum = 0
        cart_items.each do |cart_item|
            sum += cart_item.quantity * cart_item.product.price
        end
        sum
    end

    def clean!
        cart_items.destroy_all
    end
end
