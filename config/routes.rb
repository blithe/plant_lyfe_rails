Rails.application.routes.draw do

	resources :dicots, only: [:index, :show, :create], :defaults => { :format => 'json' }

end
