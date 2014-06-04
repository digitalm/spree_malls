Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :add_on_malls , :only => [:index, :new, :create, :edit, :update, :destroy] do
    end
  end


  namespace :admin , :only => [] do
      resources :products , :only => [] do
        get 'add_on_mall_prices' => 'add_on_mall_prices#index'
        resources :variants do
          get 'add_on_mall_prices/edit',      to: 'add_on_mall_prices#edit'
          patch 'add_on_mall_prices', to: 'add_on_mall_prices#update'
          resources :add_on_mall_prices, :only => [:new, :create] do
        end
      end
    end
  end

end
