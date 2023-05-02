Rails.application.routes.draw do
  root "splash#index"
  devise_for :users
  resources :categories do 
    resources :payments
  end

  get 'not_accessible', to: 'errors#not_accessible'
  get "*path'", to: "error#error_404"
end
