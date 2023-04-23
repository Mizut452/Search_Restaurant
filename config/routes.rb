Rails.application.routes.draw do
  get 'search/search'
  get '/', to: "search#application"
  get 'search', to: "search#search"
end
