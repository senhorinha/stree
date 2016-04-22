Rails.application.routes.draw do
  root 'sustainability_level_checks#index'
  resources :sustainability_level_checks, :only => [:index]
  post '/check' => 'sustainability_level_checks#check'
  get '/fetch_last_check' => 'sustainability_level_checks#fetch_last_check'

end
