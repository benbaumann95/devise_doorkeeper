class Api::ServicesController < Api::BaseController
	before_action :doorkeeper_authorize!
  before_action :set_service, only: [:show, :update, :destroy]

  def index
    @services = Service.all
    respond_with @services
  end

  def show
    render @service
  end

  def create
    @service = Service.create(service_params)
    respond_with @service
  end

  def update
    @service.update_attributes(service_params)
    respond_with @service
  end

  def destroy
    @service.destroy
    respond_with @service
  end

  private 

  def service_params
    params.require(:service).permit(:name, :description, :provider)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end