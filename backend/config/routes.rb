Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
	namespace :api do
		namespace :v1 do
			mount_devise_token_auth_for 'User', skip: [:omniauth_callbacks], at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
			namespace :auth do
        resources :sessions, only: %i[index]
				resources :main_targets do
					resources :sub_targets
				end
      end
			# resources :users, except: [:index] do
			# 	resources :main_targets do
			# 		resources :sub_targets
			# 	end
			# end
			
		end
	end

end
