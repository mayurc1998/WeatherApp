Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weather#index"
  resources :weather ,only: [:index] do
    collection do
      get :getWeather
    end
  end
end
