Rails.application.routes.draw do

	resources :dicots, only: [:index], :defaults => { :format => 'json' }

end
