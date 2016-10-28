Rails.application.routes.draw do
  resources :businesses
  root  'businesses#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
