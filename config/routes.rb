Rails.application.routes.draw do
  get 'donation_list/index'
  resources :bios
  devise_for :users
  root 'bios#new', as: :Bio
  get '/card/new' => 'donation#new_card', as: :add_payment_method
  post "/card" => "donation#create_card", as: :create_payment_method

end
