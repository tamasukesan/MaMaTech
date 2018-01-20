Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :customers
  resources :classworks
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :students, only:[:create, :edit, :update, :show, :index]

  root "customers#top"
  get '/school_details' => 'customers#school_details'
  get '/study' => 'customers#study'
  get '/price' => 'customers#price'
  get '/search' => 'customers#search'

  get '/applicants' => 'applicants#top'
  get 'applicants/flow' => 'applicants#flow'
  get 'applicants/support' => 'applicants#support'

  get '/users/customers' => 'users#manage_customer', as: "users_manage_customer"
  get '/users/customer/:id' => 'users#show_user', as: "users_show_customer"
  get '/users/customer/:id/edit(.:format)' => 'users#edit_customer_details', as: "users_edit_customer_details"

end
