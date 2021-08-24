Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/distilleries', to: 'distilleries#index'










  get '/skateboards', to: 'brands#index'
  get '/stateboards/new', to: 'brands#new' 
end
