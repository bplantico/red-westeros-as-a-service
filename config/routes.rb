Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get '/search', to: 'westeros_search#index'

  # namespace :api do
  #   namespace :v1 do
  #     resources :houses, only: [:show] do
  #       resources :members, only: [:index]
  #     end
  #   end
  # end
end
