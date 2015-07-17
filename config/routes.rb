Rails.application.routes.draw do

	resources :dicots, only: [:index, :show, :create, :destroy], :defaults => { :format => 'json' }

end
