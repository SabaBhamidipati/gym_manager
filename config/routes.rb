Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/gyms', to: 'gyms#index'
  get '/gyms/:id', to: 'gyms#show'
# :implies that route will vary depending on what' spassed to it

  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'

  get '/gyms/:gym_id/members', to: 'gym_members#index'
end
