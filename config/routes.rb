Rails.application.routes.draw do
  root to: "ideas#index"

  namespace :api do
    namespace :v1 do
      resources :ideas, except: [:new, :edit]
    end
  end
end
