Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # get "/snacks/:id", "Snacks#index"
  get '/snacks/:id', to: 'snacks#show'
  get '/snacks/s3_direct_post', to: 'snacks#s3_direct_post'
  get '/admin/s3_direct_post', to: 'admin#s3_direct_post'
end
