Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  authenticated :admin do
    resources :posts, only: [] do
      delete '', to: 'posts#destroy', as: :destroy
      resources :post_comments, only: [:destroy]
    end
  end

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :likes, only: [:index]
    resources :post_comments, only: [:create]
    
    collection do
      get 'search'
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
