Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphql", graphql_path: "graphql#execute"
  end

  resources :members, only: [:index, :show]
  post "/graphql", to: "graphql#execute"
end
