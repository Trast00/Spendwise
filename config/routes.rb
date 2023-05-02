Rails.application.routes.draw do
  root "splash#index"
  devise_for :users
  resources :categories do 
    resources :payments
  end

  get '/not_accessible', to: 'error#error403'
  get "*path", to: "error#error404"
end
