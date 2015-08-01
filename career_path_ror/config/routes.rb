Rails.application.routes.draw do

  root "home#index"

    # API definition
  namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      resources :sessions, :only => [:create, :destroy]
      resources :questions, :only => [:index]
    end
  end

end
