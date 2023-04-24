Rails.application.routes.draw do
  get 'result/result'
  get '/', to: "search#application"
  get 'search', to: "search#search"
  get 'search/detail/:id', to: "search#detail", as: 'search_detail'
end
