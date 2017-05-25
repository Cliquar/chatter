Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root to: 'chatroom#show'
    end

    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
  resources :messages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
