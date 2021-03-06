Rails.application.routes.draw do
  get '/' => 'pages#home'
  resources :folders
  resources :questions do
    resources :answers
  end
  devise_for :users, :controllers => { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
