class Admin::PagesController < Admin::AdminApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages_grid = initialize_grid(Page,
                                     order: 'updated_at',
                                     order_direction: 'desc',
                                     per_page: 10)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_page_url(@page), notice: t(:careted_success) }
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
      if @page.update(page_params)
        format.html { redirect_to session[:previous_url] || admin_page_url(@page), notice: t(:updated_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def destory
    @page.destroy
    redirect_to session[:previous_url] || admin_pages_url
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    if params[:page]
      params.require(:page).permit(:name, :photo, :detail, :weight)
    else
      nil
    end
  end
end