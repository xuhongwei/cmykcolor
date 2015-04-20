class Admin::ProductsController < Admin::AdminApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products_grid = initialize_grid(Product,
                                     order: 'updated_at',
                                     order_direction: 'desc',
                                     per_page: 10,
                                     :include => [:category])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: t(:careted_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to session[:previous_url] || admin_product_url(@product), notice: t(:updated_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def destory
    @product.destroy
    redirect_to session[:previous_url] || admin_products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    if params[:product]
      params.require(:product).permit(:name, :photo, :brief, :detail, :weight, :category_id)
    else
      nil
    end
  end
end