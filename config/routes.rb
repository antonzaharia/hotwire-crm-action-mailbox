Rails.application.routes.draw do
  root 'pages#home'
  resources :contacts do
    resources :conversations do
      resources :posts
    end
  end
end
