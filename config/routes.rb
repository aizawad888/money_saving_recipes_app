Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show]
  get "recipes/search", to: "recipes#search", as: "search_recipes"
  root "ingredients#index"
end
