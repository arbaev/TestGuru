Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  # get 'sessions/new'
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :logout, to: 'sessions#destroy'
  #
  # resources :users, only: %i[create show]
  # resources :sessions, only: :create

  get 'guru', to: 'users#show'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
