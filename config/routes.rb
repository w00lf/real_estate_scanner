Rails.application.routes.draw do
  resources :queries, via: [:post, :options]
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  end
end
