Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'

  resources :sessions, only: [:create]
  resources :todos, only: [:index, :new, :create] do
    collection do
      get :send_todos
    end
    resource :completion, only: [:create]
  end
end
