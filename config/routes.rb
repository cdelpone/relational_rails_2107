Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/skateboards', to: 'skateboards#index'
  get '/va_clinics', to: 'va_clinics#index'
end
