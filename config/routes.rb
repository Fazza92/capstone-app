Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post '/users' => 'users#create'

 namespace :api do
  get '/meetups' => 'meetups#index'
  get '/meetups/:id' => 'meetups#show'
  post '/meetups' => 'meetups#create'
  patch '/meetups/:id' => 'meetups#update'
  delete '/meetups/:id' => 'meetups#destroy'

  get '/events' => 'events#index'
  get '/events/:id' => 'events#show'
  post '/events' => 'events#create'
  patch '/events/:id' => 'events#update' 
  delete '/events/:id' => 'events#destroy'

  get '/locations' => 'locations#index'
  get '/locations/:id' => 'locations#show'
  post '/locations' => 'locations#create'
  patch '/locations/:id' => 'locations#update'
  delete '/locations/:id' => 'locations#destroy'

  end
end
