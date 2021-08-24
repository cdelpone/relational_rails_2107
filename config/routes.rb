Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/skateboards', to: 'skateboards#index'
  get '/distilleries', to: 'distilleries#index'
end
