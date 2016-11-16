Rails.application.routes.draw do
  resources :full_business_data
  resources :businesses
  resources :parks
  resources :psa_managers
  root  'parks#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
