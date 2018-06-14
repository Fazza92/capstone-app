Rails.application.routes.draw do
  post '/users' => 'users#create'

 namespace :api do
  get '/meetups' => 'meetups#index'
  get '/meetups/:id' => 'meetups#show'
  post '/meetups' => 'meetups#create'
  patch '/meetups/:id' => 'meetups#update'
  delete '/meetups/:id' => 'meetups#destroy'

  # get '/events' => 'events#index'
  # get '/events/:id' => 'events#show'
  # post '/events' => 'events#create'
  # patch '/events/:id' => 'events#update' 
  # delete '/events/:id' => 'events#destroy'

  end
end
