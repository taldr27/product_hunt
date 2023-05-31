Rails.application.routes.draw do
  get 'products', to:'products#index'
  root "main#welcome"
end
