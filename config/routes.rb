Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/scotches', to: 'scotches#index'
  get '/scotches/new', to: 'scotches#new'
  post '/scotches', to: 'scotches#create'
  get '/scotches/:id', to: 'scotches#show'
  get '/scotches/:id/edit', to: 'scotches#edit'
  patch '/scotches/:id', to: 'scotches#update'
  delete '/scotches/:id', to: 'scotches#destroy'

  get '/distilleries', to: 'distilleries#index'
  get '/distilleries/new', to: 'distilleries#new'
  post '/distilleries', to: 'distilleries#create'
  get '/distilleries/:id', to: 'distilleries#show'
  get '/distilleries/:id/edit', to: 'distilleries#edit'
  patch '/distilleries/:id', to: 'distilleries#update'
  delete '/distilleries/:id', to: 'distilleries#destroy'

  get '/distilleries/:distillery_id/scotches', to: 'distillery_scotches#index'




























  # get '/', to: 'brands#index'
  get '/brands', to: 'brands#index'
  get '/brands/new', to: 'brands#new'
  get '/brands/:id', to: 'brands#show'
  get '/brands/:id/edit', to: 'brands#edit'

  post '/brands', to: 'brands#create'
  patch '/brand/:id', to: 'brands#update'
  delete '/brands/:id', to: 'brands#destroy'

  get '/skateboards', to: 'skateboards#index'
  get '/skateboards/new', to: 'skateboards#new'
  get '/skateboards/:id', to: 'skateboards#show'
  get '/skateboards/:id/edit', to: 'skateboards#edit'

  post '/skateboards', to: 'skateboards#create'
  patch '/skateboards/:id', to: 'skateboards#update'
  delete '/skateboards/:id', to: 'skateboards#destroy'
end
