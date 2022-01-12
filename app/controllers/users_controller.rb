class UsersController < ApplicationController
  def dashboard
    @user_services_technician = current_user.services_technicians
  end
end
