Kandan::Application.routes.draw do

  devise_for :users, :controllers => {
    :sessions => "sessions"
  }
  devise_scope :user do

    get "/active_users" => "apis#active_users"
    get "/me" => "apis#me"

    authenticated :user do
      root :to => "main#index"

      get '/search' => "main#search"

      resources :channels do
        resources :activities
        resources :attachments
      end

      resources :users, :only => [:index, :show]

      get "/users/edit" =>"main#users_edit"

      namespace :admin do
        root :to => "admin#index"
        post "/update", :to => "admin#update", :as => "update"
        post "/update_user", :to => "admin#update_user", :as => "update_user"
        post "/toggle_admin", :to => "admin#toggle_admin"
      end
    end

    unauthenticated do
      root to: "sessions#new"
    end
  end

  # Pages Controller
  get "/approval", :to => "pages#approval"
  get "/suspended", :to => "pages#suspended"
  get "/about", :to =>"pages#about"

end
