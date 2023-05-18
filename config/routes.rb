Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'homes#top'
   post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
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
