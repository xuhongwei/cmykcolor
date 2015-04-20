class Admin::AdminApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # change devise controller's layout
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "admin"
    end
  end
end