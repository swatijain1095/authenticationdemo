class RolesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_role, only: [:edit, :update]
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

  def edit

  end

  def update
		if(@role.update(role_params))
			flash[:notice] = 'Role updated successfully'
			redirect_to roles_path
		else
			flash[:notice] = @role.errors.full_messages.join(",")
			redirect_to role_path(@role)
		end
	end

  def find_role
    @role = Role.find_by id: params[:id]
    unless @role
      flash[:notice] = "Role not found!!!"
      redirect_to roles_path
    end

  def role_params
    params.require(:role).permit(:name)
  end
end
end
