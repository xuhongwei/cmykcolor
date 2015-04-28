class Admin::AdminsController < Admin::AdminApplicationController
  
  before_action :set_admin, only: [:destroy]

  def index
    @admins = initialize_grid(Admin, 
                              order: 'updated_at',
                              order_direction: 'desc',
                              per_page: 10)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_admins_path, notice: t(:created_success)
    else
      render :new
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path, notice: t(:deleted_success)
  end

  private

  def admin_params
    params.require(:admin).permit(:id,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end

  def set_admin
    @admin = Admin.find_by_id(params[:id])
  end
  
end