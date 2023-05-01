Rails.application.routes.draw do
  get '/', to: "search#search_window"
  get 'search', to: "search#search"
  get 'search/result/:id', to: "search#result", as: 'search_result'
end
