Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics
  scope '/topics' do
    get '/upvote/:id' => 'topics#upvote'
    get '/downvote/:id' => 'topics#downvote'
  end
  root 'topics#index'
end
