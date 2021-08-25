Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/distilleries', to: 'distilleries#index'




































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
  patch '/brand/:id', to: 'skateboards#update'
  delete '/skateboards/:id', to: 'skateboards#destroy'

end
