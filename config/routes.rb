Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  # frontend
  resources :products, only: [:index, :show]
  resources :category, only: [] do
    resources :products, only: [:index, :show], controller: "categories/products" do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  get 'about', to: "pages#about"
  get 'contactus', to: "pages#contactus"
  get 'faq', to: "pages#faq"
  get 'term', to: "pages#term"
  get 'testimonial', to: "pages#testimonial"

  # backend
  namespace :admin do
    resources :products
    resources :categories
    resources :services
    resources :pages
  end
  
  root to: "home#index"
end
