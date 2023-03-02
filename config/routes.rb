Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'assignment#index'

  # get '/assignment', to: 'assignment#index'
  # get '/assignment', to: 'assignment#conversion'

  # get '/views', to: 'application#index'

  # get '/convertion', to: 'views#index'
  get '/', to: 'assignment#conversion'

end
