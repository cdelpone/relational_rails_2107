Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/distilleries', to: 'distilleries#index'




































  get '/skateboards', to: 'brands#index'
  get '/brands', to: 'brands#index'
  get '/brands/new', to: 'brands#new'
  get '/brands/:id', to: 'brands#show'
  get '/brands/:id/edit', to: 'brands#edit'
  post '/brands', to: 'brands#create'

end
