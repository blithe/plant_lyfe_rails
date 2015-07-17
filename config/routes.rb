Rails.application.routes.draw do

	resources :dicots, only: [:index, :show], :defaults => { :format => 'json' }

end
