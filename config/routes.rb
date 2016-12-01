Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
        resources :users do
            post :approve_admin
            post :cancel_admin
        end
        resources :orders do
            member do
                post :cancel
                post :ship
                post :shipped
                post :return
            end
        end
        resources :products do
            member do
                post :hide
                post :publish
            end
        end
    end
    namespace :account do
        resources :orders
        resources :products do
            member do
                post :add_to_cart
            end
        end
    end
    resources :carts do
        collection do
            post :checkout
            delete :clean
        end
    end
    resources :cart_items
    resources :orders do
        member do
            post :apply_to_cancel
            post :pay_with_alipay
            post :pay_with_wechat
        end
    end
    root 'landingpage#index'
end
