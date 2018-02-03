Rails.application.routes.draw do
  get 'answer/new'

  get 'answer/create'

  get 'answer/edit'

  get 'answer/update'

  get 'answer/show'

  get 'answer/destroy'

  get 'question/new'

  get 'question/create'

  get 'question/edit'

  get 'question/update'

  get 'question/destroy'

  get 'folder/new'

  get 'folder/create'

  get 'folder/show'

  get 'folder/index'

  get 'folder/edit'

  get 'folder/update'

  get 'folder/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
