class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_admin
    layout 'admin'
    def index
        @users = User.where(role: 'admin').order('is_admin ASC')
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
end
