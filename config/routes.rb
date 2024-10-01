Rails.application.routes.draw do

 devise_for :books
  devise_for :users
  root to: "homes#top"
   get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: [:index, :show, :edit, :new, :create, :update]
  resources :users, only: [:show, :edit, :update]
    resources :search do
    collection do
      get 'search'
    end
  end
   get "search_tag"=>"posts#search_tag"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
