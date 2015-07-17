Rails.application.routes.draw do

	resources :dicots, :defaults => { :format => 'json' } do
        resources :leaf, only: [:create, :show, :update, :destroy], controller: 'leafs'
    end

  get 'dicots/leaf/search' => 'leafs#index'

end
