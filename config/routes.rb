Rails.application.routes.draw do
  get 'reviews/new'
  resources :restaurants do
    collection do
      # GET "restaurants/top"
      get :top
    end

    member do
      # GET "restaurants/:id/chef"
      get :chef
    end

    # GET "restaurants/:id/reviews/new"
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
end
