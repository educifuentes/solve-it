class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def autocomplete
    puts params[:query]
    if params[:query].present?
      @services = Service.search_by_name_and_category(params[:query])
    else
      @services = nil
    end
    puts @services
    render json: @services
  end
end
