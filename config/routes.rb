Rails.application.routes.draw do

	resources :dicots, :defaults => { :format => 'json' }

end
