class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def search
    query = Service.where("lower(categories.name) LIKE :search OR lower(services.name)
      LIKE :search OR lower(services.description) LIKE :search",
                          search: "%#{params[:query].downcase}%").joins(:category)

    @services = query
  end
end
