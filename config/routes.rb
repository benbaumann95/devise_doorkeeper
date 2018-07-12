Rails.application.routes.draw do
  use_doorkeeper do
  	skip_controllers :authorizations, :applications,
    	:authorized_applications
	end

  devise_for :users

	root to: 'services#index'

  resources :services

  namespace :api do
  	resources :services
	end
end
