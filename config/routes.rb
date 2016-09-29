Rails.application.routes.draw do
  get 'dashboard/index'

  resources :expenses

  resources :categories

  resources :subcategories, only: :show

  resources :incomes

  devise_for :users

  root 'expenses#new'

  resources :tags, except: :show

  get 'tags/:tag', to: 'expenses#index'
end
