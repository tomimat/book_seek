Rails.application.routes.draw do

 devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
 }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
     resources :users, only: [:destroy]
     resources :books, only: [:destroy]
  end

  devise_for :users
  root to: "homes#top"
   get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]

    resources :search do
    collection do
      get 'search'
    end
  end
   get "search_tag"=>"books#search_tag"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end


