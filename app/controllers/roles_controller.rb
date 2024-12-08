class RolesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = 'Role created successfully'
      redirect_to roles_path
    else
      flash[:notice] = @role.errors.full_messages.join(",")
      redirect_to new_role_path
    end
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
