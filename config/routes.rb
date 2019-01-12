Rails.application.routes.draw do
  resources :tests do
    resources :questions
  end

  get '/tests/:test_id/questions/:id/delete', to: 'questions#destroy'
end
