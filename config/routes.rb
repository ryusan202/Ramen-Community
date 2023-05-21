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
resources :genres, only: [:show]
  authenticated :admin do
    get 'admin_page', to: 'admin/posts#date_base'
    resources :posts, only: [] do
      delete '', to: 'posts#destroy', as: :destroy
      resources :post_comments, only: [:destroy]
    end
  end

  namespace :admin do
    resources :posts, only: [:index] do
      member do
        delete 'destroy_comment', to: 'posts#destroy_comment', as: 'destroy_comment'
        delete 'destroy_post', to: 'posts#destroy_post', as: 'destroy_post'
      end
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
