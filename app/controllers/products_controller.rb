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
    @products = Product.search_by_name_and_detail(params[:q]).try(:page, params[:page])
  end
end
