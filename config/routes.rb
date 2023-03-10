Rails.application.routes.draw do
  devise_for :users, :controllers =>{:sessions => "users/sessions"}
  root to: "pages#home"
  get "/doctor_home", to: "pages#doctor_home"
  get "/patient_home", to: "pages#patient_home"

  namespace :doctor do
    resources :prescriptions, only: [:index, :show, :create, :edit, :update] do
      resources :prescription_items, only: [:create]
    end
    resources :prescription_items, only: [:destroy, :update]
  end

  namespace :patient do
    resources :prescriptions, only: [:show, :index]
  end

  resources :prescriptions, only: [] do
    resources :pharmacies, only: [:show, :index]
  end

  resources :carts, only: [:update] do
    resources :cart_items, only: [:create]
  end

  resources :cart_items, only: [:update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
