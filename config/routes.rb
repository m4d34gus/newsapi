Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	constraints subdomain: 'api' do
  		scope module: 'api' do
    		namespace :v1 do
    			post 'authenticate', to: 'authentications#authenticate'
    			resources :users
          resources :categories
          resources :advertisments
          #resources :articles
          resources :comments
					resources :subcategories
          resources :lens



					resources :categories do
						resources :articles
          end

          resources :categories do
            resources :subcategories
          end

					get '/articles/last', to: 'articles#last'
					get '/articles/:id', to: 'articles#show'
          post '/articles', to: 'articles#create'
          get '/articles', to: 'articles#index'
          put '/articles/:id', to: 'articles#update'
          delete '/articles/:id', to: 'articles#destroy'
    		end
    	end
    end
end
