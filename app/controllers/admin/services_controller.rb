class Admin::ServicesController < Admin::AdminApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services_grid = initialize_grid(Service,
                                     order: 'updated_at',
                                     order_direction: 'desc',
                                     per_page: 10)
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_service_url(@service), notice: t(:created_success) }
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
      if @service.update(service_params)
        format.html { redirect_to session[:previous_url] || admin_service_url(@service), notice: t(:updated_success) }
      else
        format.html { render :edit }
      end
    end
  end

  def destory
    @service.destroy
    redirect_to session[:previous_url] || admin_services_url
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    if params[:service]
      params.require(:service).permit(:name, :photo, :detail, :weight)
    else
      nil
    end
  end
end