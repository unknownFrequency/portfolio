Rails.application.routes.draw do
  resources :portfolios
  resources :posts

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

end
