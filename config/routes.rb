Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/gyms', to: 'gyms#index'
  get '/gyms/new', to: 'gyms#new'
  get '/gyms/:id', to: 'gyms#show'
  get '/gyms/:id/edit', to: 'gyms#edit'
  post '/gyms', to: 'gyms#create'
  patch '/gyms/:id', to: 'gyms#update'
  #routes should be ordered as new and then :id, any route with two words should come before one with a dynamic variable
  #or generally, dynamic route should come after static route
# :implies that route will vary depending on what' spassed to it

  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'

  get '/gyms/:gym_id/members', to: 'gym_members#index'
end
