Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :jobs do
        resources :resumes
    end
    namespace :admin do
        resources :jobs do
            resources :resumes
            member do
                post :publish
                post :hide
            end
        end
    end
    root 'jobs#index'
end
