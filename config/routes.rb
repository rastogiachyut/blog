Rails.application.routes.draw do

  resources :avatars
  root 'posts#index_blog', as: 'home', via: :all
  get "/home" => "posts#index_blog"
  get "/search", to: "posts#search"

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users, only: [:create, :new, :show] do
    resource :avatars, only: [:index, :create, :new]
    resources :posts do
      resources :comments, only: [:destroy, :create, :new]
    end
  end

  resources :posts, only: [:index_blog, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
