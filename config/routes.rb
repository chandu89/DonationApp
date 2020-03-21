Rails.application.routes.draw do
  resources :bios
  devise_for :users
  root 'bios#new', as: :Bio
  get '/card/new' => 'donation#new_card', as: :add_payment_method
  post "/card" => "donation#create_card", as: :create_payment_method

end
