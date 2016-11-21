Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
        resources :products do
            member do
                post :hide
                post :publish
            end
        end
    end
    namespace :account do
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
    resources :orders
    root 'landingpage#index'
end
