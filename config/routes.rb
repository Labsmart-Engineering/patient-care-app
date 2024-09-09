Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  get 'home/about'
  root 'home#index'
  get 'home/add'
  resources :patients
  resources :doctors
  resources :appointments do
    post 'send_email_to_doctor', on: :member
    post 'send_email_to_patient', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'performance_test/empty'

  get 'performance_test/complex_haml_component'
  get 'performance_test/complex_erb_component'

  get 'performance_test/icon_from_helper'
  get 'performance_test/icon_from_gem'

  get 'performance_test/complex_haml_view'
  get 'performance_test/complex_erb_view'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'home/old_about', to: redirect('home/about')
  # Defines the root path route ("/")
  # root "posts#index"
end
