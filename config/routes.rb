Rails.application.routes.draw do

	resources :dicots, :defaults => { :format => 'json' } do
        resource :leaf
    end

end
