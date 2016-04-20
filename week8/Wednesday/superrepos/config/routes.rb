Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stuff#index'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  scope "/api" do
    get "/" => 'stuff#index', :defaults => { :format => 'json' }
  end

end
