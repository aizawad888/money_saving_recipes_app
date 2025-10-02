Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show]
  get "recipes/search", to: "recipes#search"
  root "ingredients#index"
end
