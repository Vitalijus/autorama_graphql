Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "pages#home"

  # Redirect all unknown routes to root_url / keep at the bottom of routes.rb
  get '*path' => redirect('/')
end
