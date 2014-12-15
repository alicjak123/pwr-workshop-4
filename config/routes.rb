Rails.application.routes.draw do
  namespace :api do
    resources :digs, only: [:show, :index, :create, :destroy, :update] do
    	member do
    		post :vote
    	end
      resources :comments, only: [:show, :index]
    end
  end

  get 'api' => proc { [404, {}, ['Invalid API endpoint']] }
  get 'api/*path' => proc { [404, {}, ['Invalid API endpoint']] }

  root 'home#index'

  get '*path', to: 'home#index'
end

