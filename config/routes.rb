Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end

  root to: "items#index"
  resources :cards, only: [:new, :create]
  resources :items do
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
    end
    collection do
      get 'search_option'
    end
  end
end
