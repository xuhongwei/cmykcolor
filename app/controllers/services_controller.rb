class ServicesController < ApplicationController
  
  def index
    @services = Service.page params[:page]
    set_page_title "Services"
  end

  def show
    @service = Service.friendly.find(params[:id])
    @previous = Service.friendly.previous(@service, 1).first
    @next = Service.friendly.next(@service, 1).first
    set_page_title @service.name
  end
  
end