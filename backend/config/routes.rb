Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :users, except: [:index] do
				resources :main_targets do
					resources :sub_targets
				end
			end
			
		end
	end

end
