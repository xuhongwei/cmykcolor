class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(3)
    @services = Service.all.limit(4).to_a
    respond_to do |format|
      format.js
      format.html
    end
  end
end
