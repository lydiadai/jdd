module Admin::ProductsHelper
    def render_product_status(product)
        if product.is_hidden
            link_to(content_tag(:span, '', class: 'fa fa-arrow-up'), publish_admin_product_path(product), method: :post, class: 'btn btn-link')
        else
            link_to(content_tag(:span, '', class: 'fa fa-arrow-down'), hide_admin_product_path(product), method: :post, class: 'btn btn-link')
        end
    end
end
