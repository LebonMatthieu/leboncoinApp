Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users/:id', :to => 'users#show', :as => :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :adverts
  root "adverts#index"
end
