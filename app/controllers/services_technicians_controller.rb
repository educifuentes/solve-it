class ServicesTechniciansController < ApplicationController
  def index
    @services_technicians = ServicesTechnician.all.where(service_id: params[:service_id])
  end

  def new
    @service = ServicesTechnician.new
    @user = current_user
  end

  def create
    @service_technician = ServicesTechnician.new(services_technician_params)
    @service_technician.user = current_user

    if @service_technician.save
      redirect_to new_services_technician_path
    else
      render :new
    end
  end

  def show
    @service_technician = ServicesTechnician.find(params[:id])
  end

  private

  def services_technician_params
    params.require(:services_technician).permit(:fee_amount, :service_id)
  end
end
