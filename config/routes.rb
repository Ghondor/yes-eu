Rails.application.routes.draw do
  devise_for :students
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#home"

  namespace :dashboard do
    get 'pages/home'

    root to: "pages#home"
  end
end
