class ProductsController < ApplicationController
  def index
    @products = Product.page params[:page]
    set_page_title "Products"
  end

  def show
    @product = Product.friendly.find(params[:id])
    @previous = Product.friendly.previous(@product, 1).first
    @next = Product.friendly.next(@product, 1).first
    set_page_title @product.name
  end

  def search
    @products = Product.search(params[:q]).page params[:page]
  end
end
