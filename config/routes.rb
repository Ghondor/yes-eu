Rails.application.routes.draw do
  # devise_for :students
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end
  # devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  # }

  namespace :dashboard do
    get 'pages/home'

    root to: "pages#home"
  end

  authenticated :user do
    root to: 'dashboard/pages#home', as: 'authenticated_root'
  end

  unauthenticated :user do
    root to: 'pages#home', as: 'unauthenticated_root'
  end
end
