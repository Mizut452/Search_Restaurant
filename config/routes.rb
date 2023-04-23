Rails.application.routes.draw do
  get '/', to: "search_home#application"
  get 'search', to: "search_home#result"
end
