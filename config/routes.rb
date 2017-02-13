Rails.application.routes.draw do
  get 'dashboard/index'

  resources :queries, via: [:post, :options]
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  end

  root 'dashboard#index'
end
