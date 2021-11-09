Rails.application.routes.draw do
  # set routes to access view
  root to: 'recipes#home'
    get "/:id", to: "recipes#show", as: :recipe
end
