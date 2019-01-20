Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 語法註解備用 resources :endgrades, only: [:index, :show]
  root "endgrades#index"

  namespace :admin do
    resources :endgrades

    root "surveys#index"
    resources :surveys do
      member do
        get :go_endings
        get :edit_endgrades
        patch :update_number_of_player
      end
    end
  end
end
