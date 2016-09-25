Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	constraints subdomain: 'api' do
  		scope module: 'api' do
    		namespace :v1 do
    			post 'authenticate', to: 'authentications#authenticate'
    			resources :users
          resources :categories
          resources :advertisments
          resources :articles
          resources :comments
    		end
    	end
    end
end
