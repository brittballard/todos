Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'

  resources :sessions, only: [:create]
end
