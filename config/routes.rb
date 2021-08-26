
Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/distilleries', to: 'distilleries#index'
  get '/distilleries/new', to: 'distilleries#new'
  get '/distilleries/:id', to: 'distilleries#show'
  get '/distilleries/:id/edit', to: 'distilleries#edit'
  post '/distilleries', to: 'distilleries#create'
  patch '/distilleries/:id', to: 'distilleries#update'
  delete '/distilleries/:id', to: 'distilleries#destroy'

  get '/scotches', to: 'scotches#index'
  get '/scotches/new', to: 'scotches#new'
  get '/scotches/:id', to: 'scotches#show'
  get '/scotches/:id/edit', to: 'scotches#edit'
  post '/scotches', to: 'scotches#create'
  patch '/scotches/:id', to: 'scotches#update'
  delete '/scotches/:id', to: 'scotches#destroy'



























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

  get '/brands/:b_id/skateboards', to: 'brands_skateboards#index'

end
