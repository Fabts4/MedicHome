Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  namespace :doctor do
    resources :prescriptions, only: [:index, :show, :create, :edit, :update] do
      resources :prescription_items, only: [:create, :update, :destroy]
    end
  end

  namespace :patient do
    resources :prescriptions, only: [:show, :index]
  end

  resources :prescriptions, only: [] do
    resources :pharmacies, only: [:show, :index]
  end

  resources :baskets, only: [:create, :update] do
    resources :orders, only: [:create, :update, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
