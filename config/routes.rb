Rails.application.routes.draw do
  resources :bios
  devise_for :users
  root 'bios#new', as: :Bio 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
