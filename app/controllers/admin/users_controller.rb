class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_admin
    layout 'admin'
    def index
        @vip_users = User.where(role: 'vip')
        @admin_users = User.where(role: 'admin')
    end

    def approve_admin
        @user = User.find(params[:user_id])
        @user.approve!
        redirect_to :back
    end

    def cancel_admin
        @user = User.find(params[:user_id])
        @user.cancel!
        redirect_to :back
    end

    def approve_vip
        @user = User.find(params[:user_id])
        @user.approv!
        redirect_to :back
    end

    def cancel_vip
        @user = User.find(params[:user_id])
        @user.cance!
        redirect_to :back
    end
end
