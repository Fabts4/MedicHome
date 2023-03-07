Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :prescriptions, only: [:index, :show, :create, :edit, :update] do
    resources :prescription_items, only: [:create, :update, :destroy]
  end

  resources :pharmacies, only: [:index, :show] do
    resources :baskets, only: [:new, :create] do
      resources :orders, only: [:create]
    end
  end


  resources :pharmacies, only: [:show, :index]

  namespace :patient do
    resources :prescription, only: [:show] do
      resources :pharmacies, only: [:show, :index]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
