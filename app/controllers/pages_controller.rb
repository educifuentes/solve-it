class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @categories = Category.all
  end

  def autocomplete
    puts params[:query]
    if params[:query].present?
      @services = Service.search_by_name_and_category(params[:query])
    else
      @services = Service.all
    end
    puts @services
    render json: @services
  end

end
