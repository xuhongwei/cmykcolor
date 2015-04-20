class Admin::CategoriesController < Admin::AdminApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories_grid = initialize_grid(Category,
                                       order: 'updated_at',
                                       order_direction: 'desc',
                                       per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_url(@category), notice: t(:created_success) }
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
      if @category.update(category_params)
        format.html { redirect_to session[:previous_url] || admin_category_url(@category), notice: t(:updated_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def destory
    @category.destroy
    redirect_to session[:previous_url] || admin_categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    if params[:category]
      params.require(:category).permit(:name, :weight)
    else
      nil
    end
  end
end