Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  authenticated :user do
    get 'pages/my_todo_items', as: :authenticated_root
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :todo_items, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
