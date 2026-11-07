Rails.application.routes.draw do
  resources :todos, only: %i[index show create update destroy]
  get "health", to: "health#show"
  root to: "home#show"
end
