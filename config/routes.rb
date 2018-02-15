Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => :registrations}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 書く位置に気をつけてね！
  get '/users/:id/customers' => 'users#manage_customer', as: 'users_manage_customer'
  # IDを２つ持つURLの時は『:user_id』と記載すること！
  get '/users/:user_id/customer/:id' => 'users#show_customer', as: "users_show_customer"

  resources :customers do
    collection do
      post 'confirm'
    end
  end
  resources :classworks
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :students, only:[:create, :update, :show, :index]

  root "customers#top"
  get '/school_details' => 'customers#school_details'
  get '/study' => 'customers#study'
  get '/price' => 'customers#price'
  get '/search' => 'customers#search'
  get '/complete' => 'customers#complete'

  get '/applicants' => 'applicants#top'
  get 'applicants/flow' => 'applicants#flow'
  get 'applicants/support' => 'applicants#support'

end
