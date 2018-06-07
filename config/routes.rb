Rails.application.routes.draw do
  post '/users' => 'users#create'

 namespace :api do
  get '/meetups' => 'meetups#index'
  get '/meetups/:id' => 'meetups#show'
  post '/meetups' => 'meetups#create'
  end
end
