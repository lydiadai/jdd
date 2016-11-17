class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def require_is_admin
        unless current_user.admin?
            flash[:alert] = '您不是商家，不可操作！'
            redirect_to root_path
        end
    end
end
