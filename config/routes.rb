Rails.application.routes.draw do
  get 'games/new'
  get 'games/score'
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
