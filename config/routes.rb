Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'user/registrations'
  }

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
