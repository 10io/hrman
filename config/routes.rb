Rails.application.routes.draw do
  resources :employees, :except => %i(show)
  root 'employees#index'
end
