Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics
  scope 'api/topics/:id' do
    post '/upvote' => 'api/topics_api#upvote'
    post '/downvote' => 'api/topics_api#downvote'
  end
  root 'topics#index'
end
