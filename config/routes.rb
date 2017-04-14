Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'topics#index'

  scope '/topics' do
    get '/new' => 'topics#new'
    post '/new' => 'topics#create'
    get '/:topic_id' => 'topics#show'
  end
end
