class StaffUsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @staff_users = Admin.staff_user
  end
end
