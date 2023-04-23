Rails.application.routes.draw do
  get 'search/search'
  get '/', to: "search_home#application"
  get 'search', to: "search_home#result"
end
