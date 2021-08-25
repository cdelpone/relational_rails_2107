Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/skateboards', to: 'skateboards#index'
  get '/distilleries', to: 'distilleries#index'
  get '/distilleries/new', to: 'distilleries#new'
  post '/distilleries', to: 'distilleries#create'
  get '/distilleries/:id', to: 'distilleries#show'
  get '/distilleries/:id/edit', to: 'distilleries#edit'
  patch '/distilleries/:id', to: 'distilleries#update'
  delete '/distilleries/:id', to: 'distilleries#destroy'
end
