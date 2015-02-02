class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init_categories
  skip_before_action :verify_authenticity_token, if: :json_request?

  private
  
  def init_categories
    @categories = Category.all.order(weight: :desc, id: :desc)
  end

  def json_request?
    request.format.json?
  end
end
