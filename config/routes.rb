Rails.application.routes.draw do
  resources :contacts, only: [:index] do
    resources :conversations
  end
end
