Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'campaigns', to: 'campaigns#index'

      post 'investments', to: 'investments#create'
    end
  end
end
