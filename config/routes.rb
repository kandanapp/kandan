def authenticated_or_have_token (scope=nil, block=nil)
  constraint = lambda do |request|
    (request.env["warden"].authenticate?(:scope => scope) ||
     request.query_parameters['auth_token'].present?) &&
         (block.nil? || block.call(request.env["warden"].user(scope)))
  end

  constraints(constraint) do
    yield
  end
end

Kandan::Application.routes.draw do

  devise_for :users, :controllers => {
    :sessions => "sessions"
  }
  devise_scope :user do

    resources :channels do
      resources :activities
      resource :attachments
    end

    authenticated_or_have_token :user do
      get "/active_users" => "apis#active_users"
      get "/me" => "apis#me"

      resources :users, :only => [:index, :show]
    end

    authenticated :user do
      root :to => "main#index"

      get '/search' => "main#search"
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
