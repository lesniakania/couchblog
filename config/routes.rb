Couchblog::Application.routes.draw do
  resources :users, :except => [:edit, :update] do
    resources :posts
  end

  namespace 'api' do
    resources :users, :only => [:show]
  end

  root :to => 'users#index'
end
