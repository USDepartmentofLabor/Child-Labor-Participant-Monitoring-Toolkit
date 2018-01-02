Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get 'targets/index'

  get 'gender_count/:id' => 'projects#gender_count'

  resource :project do
    get :dashboard
    get :status_config
    get :reporting_table
  end

  resources :households do
    resources :income_sources
    resources :people do
      resources :follow_ups
      resources :service_instances
      resources :timelines, only: [:index]
    end
    post :finalize, on: :member
  end

  resources :indicators do
    resources :indicator_details
    resources :targets do
      collection do
        get :edit_multiple
        post :create_multiple
        put :update_multiple
      end
    end
  end

  resources :locales do
    resources :translations, constraints: { :id => /[^\/]+/ }
  end

  resources :custom_fields
  resources :locations
  resources :project_targets
  resources :regions, defaults: {format: :json}
  resources :relationships, except: [:show]
  resources :reports, except: [:edit, :update]
  resources :roles
  resources :service_type_categories
  resources :service_types
  resources :services
  resources :technical_progress_reports
  resources :users
  resources :work_activities
  resources :hazardous_conditions
  resources :household_tasks

  devise_for :users, skip: [:sessions, :registrations, :confirmations]

  as :user do
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'sign_up' => 'registrations#new', as: :new_user_registration
    post 'sign_up' => 'registrations#create', as: :user_registration

    put 'sign_up' => 'devise/registrations#update', as: nil
    patch 'sign_up' => 'devise/registrations#update', as: nil

    get 'confirm_account' => 'devise/confirmations#show', as: :user_confirmation
  end

  # Api definition
  namespace :api do
    namespace :v1 do
      resources :households, :tokens, :income_sources
    end
  end

  root to: "home#index"
end
