ZenlabsBeta::Application.routes.draw do
  # get "session/create"

  # get "session/destroy"

  get "ember/start"

  # resources :extensions
  # root :to => 'extensions#index'
  namespace :api do
    namespace :v1 do
      resources :extensions, :defaults => { :format => 'json' }
      match 'extensions/github_push' => 'extensions#github_push', :via => :post 
      match "get_auth_url" => 'zendesk_client#get_auth_url', :via => :get
      match "zendesk_client/callback" => 'zendesk_client#callback', :via => :get
      match "passback" => 'zendesk_client#passback'
      match "set_account" => 'zendesk_client#set_account', :via => :post
    end
  end

  root :to => 'ember#start'
  
  mount JasmineRails::Engine => '/spec' if defined?(JasmineRails)

end
