Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'hospitals/:hospital_id/appointments/:id/accept', to: 'appointments#accept', as: 'accept_hospital_appointment'
  get 'hospitals/:hospital_id/appointments/:id/reject', to: 'appointments#reject', as: 'reject_hospital_appointment'

  resources :hospitals do
    resources :treatments

    resources :doctors do
      get :add_doctor, :remove_doctor
    end
    resources :assign_treatments do
      get  :remove_treatment
      post :add_treatment
    end
    resources :appointments do
      member do
        put :accept
        put :reject
      end
    end
  end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  root to: 'hospitals#index'
end
