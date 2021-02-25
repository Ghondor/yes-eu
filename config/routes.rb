Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  namespace :dashboard do
    get 'pages/home'
    resources :rooms, only: [:index]
    resources :levels
    resources :questions
    root to: "pages#home"
  end

  authenticated :user do
    root to: 'dashboard/pages#home', as: 'authenticated_root'
  end

  unauthenticated :user do
    root to: 'pages#home', as: 'unauthenticated_root'
  end
end
