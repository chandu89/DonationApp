Rails.application.routes.draw do
  get 'donation_list/index'
  resources :bios
  devise_for :users
  root 'bios#new', as: :Bio
  get '/card/new' => 'donation#new_card', as: :add_payment_method
  post "/card" => "donation#create_card", as: :create_payment_method
  get '/donate/new' => 'donation_list#new_card', as: :add_donate_payment_method
  post "/donate" => "donation_list#create_card", as: :create_donate_payment_method
end
