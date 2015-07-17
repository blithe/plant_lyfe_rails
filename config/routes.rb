Rails.application.routes.draw do

	resources :dicots, :defaults => { :format => 'json' } do
        resource :leaf, only: [:create, :show, :update, :destroy]
    end

  get 'dicots/leaf/search' => 'leafs#index'

end
