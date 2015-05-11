class Admin::BannersController < Admin::AdminApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  def index
    @banners_grid = initialize_grid(Banner,
                                    order: 'updated_at',
                                    order_direction: 'desc',
                                    per_page: 10)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to admin_banners_url, notice: t(:created_success) }
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
      if @banner.update(banner_params)
        format.html { redirect_to admin_banners_url, notice: t(:updated_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def destory
    @banner.destroy
    redirect_to session[:previous_url] || admin_banners_url
  end

  private

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    if params[:banner]
      params.require(:banner).permit(:name, :photo, :url, :weight)
    else
      nil
    end
  end
end