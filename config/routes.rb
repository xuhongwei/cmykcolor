Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  # concern
  concern :commentable do
    resources :comments
  end
  # frontend
  resources :products, only: [:index, :show] do
    get :search, on: :collection
  end
  resources :services, only: [:index, :show]
  resources :news, only: [:index, :show], concerns: :commentable
  resources :category, only: [] do
    resources :products, only: [:index, :show], controller: "categories/products" do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  resources :pages, only: [:show], concerns: :commentable
  Page::PAGE_TYPES.each do |page_type|
    get page_type, to: "pages##{page_type}"
  end

  # backend
  namespace :admin do
    resources :products
    resources :categories
    resources :services
    resources :pages
    resources :news
    resources :admins, only: [:index, :new, :destroy, :create]
    resources :banners
    resources :comments
  end
  
  root to: "home#index"
end
