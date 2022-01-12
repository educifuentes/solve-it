class ServicesTechniciansController < ApplicationController
  def index
    @services_technicians = ServicesTechnician.all.where(service_id: params[:service_id])
  end

  def new
    @service_technician = ServicesTechnician.new
    @user = current_user
  end

  def create
    @service_technician = ServicesTechnician.new(services_technician_params)
    @service_technician.user = current_user

    if @service_technician.save
      redirect_to services_technician_path(@service_technician.id)
    else
      render :new
    end
  end

  def show
    @service_technician = ServicesTechnician.find(params[:id])
  end

  def edit
    @service_technician = ServicesTechnician.find(params[:id])
  end

  def update
    @service_technician = ServicesTechnician.find(params[:id])
    @service_technician.update(services_technician_params)

    redirect_to services_technician_path(@service_technician)
  end

  private

  def services_technician_params
    params.require(:services_technician).permit(:price, :service_id)
  end
end
