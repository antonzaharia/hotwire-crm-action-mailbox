Rails.application.routes.draw do
  resources :contacts do
    resources :conversations do
      resources :posts
    end
  end
end
