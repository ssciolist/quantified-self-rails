Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :create, :show, :update, :destroy]
      resources :meals, only: [:index] do
        get '/foods', to: 'meals#show'
        post '/foods/:food_id', to: 'meals#update'
        delete '/foods/:food_id', to: 'meals#destroy'
      end
    end
  end
end
