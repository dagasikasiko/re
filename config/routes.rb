Rails.application.routes.draw do
  root :to => 'contents#top'
  get 'contents/watch1'
  get 'contents/watch2'
  get 'contents/watch3'
  get 'contents/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
