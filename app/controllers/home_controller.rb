class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(3)
    respond_to do |format|
      format.js
      format.html
    end
  end
end
