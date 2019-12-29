Rails.application.routes.draw do
  root 'ideas#index'

  get 'session/new', as: :sign_in
  delete 'session', action: :destroy, controller: 'session', as: :sign_out
  get '/auth/github/callback', action: :create, controller: 'session'

  get 'privacy', action: :privacy, controller: 'page'
  get 'markdown_help', action: :markdown_help, controller: 'page'
  resources :ideas
  resources :messages, only: [:new, :create, :edit, :update, :destroy]
  resources :repositories

  if Rails.env.test? || Rails.env.development?
    get :test_flash, controller: 'tests'
    get :colors, controller: 'tests'
  end
end
