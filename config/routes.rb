Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 語法註解備用 resources :endgrades, only: [:index, :show]
  root "endgrades#index"

  namespace :admin do
    root "endgrades#index"
  end
end
