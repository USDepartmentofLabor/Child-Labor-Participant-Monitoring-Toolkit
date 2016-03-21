Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get 'targets/index'

  get 'gender_count/:id' => 'projects#gender_count'

  resource :project

  resource :home

  resources :indicators do
    resources :targets do
      collection do
        post :create_multiple
      end
    end
  end

  resources :reports, except: [:edit, :update]
  resources :children do
    resources :timelines
  end
  resources :households
  resources :custom_fields
  resources :users
  resources :services
  resources :users
  resources :service_types

  # a trick to avoid generating children urls again
  resources :children, only: [] do
    resources :child_statuses
    resources :service_instances
    collection do
      match 'search' => 'children#search', via: [:get, :post], as: :search
    end
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
