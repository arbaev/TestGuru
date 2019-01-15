Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  get '/', to: 'tests#index'
end
