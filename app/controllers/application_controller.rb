class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    def require_is_admin
        unless current_user.admin?
            flash[:alert] = '您不是商家，不可操作！'
            redirect_to root_path
        end
    end
    helper_method :current_cart
    def current_cart
        @current_cart ||= find_cart
    end

    private

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])
        cart = Cart.create if cart.blank?
        session[:cart_id] = cart.id
        cart
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end
end
