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
    resources :home, only: :index
    resources :contests
    resources :payments
    resources :member_contests, only: :show
  end

  namespace :admins do
    resources :homes
    resources :list_contests do
      collection do
        get :list_wira
      end
    end
    resources :payments, only: %i[index show] do
      member do
        put :accept
        put :reject
      end
    end
    resources :notifications, only: %i[index show] do
      collection do
        get :all_notification_read
      end
    end
    resources :users, only: %i[index show]
    root 'homes#index'
  end

  resources :homes

  root 'homes#index'
end
