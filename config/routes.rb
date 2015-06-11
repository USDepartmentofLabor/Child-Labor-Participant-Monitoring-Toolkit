Rails.application.routes.draw do

  resources :reports
  
  resources :children do
    resources :child_statuses
  end

  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'sign_up' => 'registrations#new', as: :new_user_registration
    post 'sign_up' => 'registrations#create', as: :user_registration

    put 'sign_up' => 'devise/registrations#update', as: nil
    patch 'sign_up' => 'devise/registrations#update', as: nil
  end

  root to: "home#index"
end
