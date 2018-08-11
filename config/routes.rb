Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/overall'

  resources :expenses, only: %i[show destroy]
  resources :bills

  get 'tracking/', to: 'expenses#tracking'
  get 'expenses/', to: 'bills#index'

  resources :categories

  resources :contractors

  resources :savings

  resources :subcategories, only: :show

  resources :incomes

  devise_for :users, skip: [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end

  root 'bills#new'

  resources :tags, except: :show

  get 'tags/:tag', to: 'tags#index'
end
