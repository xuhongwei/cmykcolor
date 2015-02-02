Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  resources :category, only: [] do
    resources :products, only: [:index, :show], controller: "categories/products" do
      get 'page/:page', :action => :index, :on => :collection
    end
  end
  resources :pages, only: [] do
    get 'about'
    get 'contactus'
    get 'faq'
  end
  get 'about', to: "pages#about"
  get 'contactus', to: "pages#contactus"
  get 'faq', to: "pages#faq"
  root to: "home#index"
end
