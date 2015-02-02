class Categories::ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id]);
    @products = @category.products.page(params[:page]) unless @category.blank?
    set_page_title @category.name
  end

  def show
    @category = Category.find(params[:category_id]);
    @product = Product.friendly.find(params[:id])
    @previous = @category.products.friendly.previous(@product, 1).first
    @next = @category.products.friendly.next(@product, 1).first
    set_page_title @product.name
  end
end
