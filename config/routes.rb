Rails.application.routes.draw do
  root 'search_home#index'
  get 'home/index', to: 'search_home#index'
  get 'home/search', to: 'search_home#result'
end
