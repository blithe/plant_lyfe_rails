Rails.application.routes.draw do

	resources :dicots, :defaults => { :format => 'json' } do
        resources :leafs, :defaults => { :format => 'json' }
    end

end
