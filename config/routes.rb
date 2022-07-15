Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/devise/sessions'
  }

  devise_for :users, controllers: {
         sessions: 'users/devise/sessions',
    registrations: 'users/devise/registrations',
      invitations: 'users/devise/invitations',
        passwords: 'users/devise/passwords',
    confirmations: 'users/devise/confirmations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :users do
    resources :home
    resources :contests
    resources :payments
  end

  namespace :admins do
    resources :homes
    resources :list_contests
    resources :payments, only: %i[index show] do
      member do
        put :accept
        put :reject
      end
    end
    root 'homes#index'
  end

  resources :homes

  root 'homes#index'
end
