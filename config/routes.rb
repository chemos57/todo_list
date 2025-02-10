Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root 'todos#index' # Keep this for the web interface
  resources :todos # Keep the REST routes for the web interface
end
