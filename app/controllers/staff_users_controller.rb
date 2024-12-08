class StaffUsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :fetch_roles
  before_action :find_staff_user, only: [:edit, :update, :destroy]
  def index
    @staff_users = Admin.staff_user
  end

  def new 
    @staff_user = Admin.staff_user.new
  end

  def create
    @staff_user = Admin.staff_user.new(staff_user_params)
    if @staff_user.save
      flash[:notice] = 'Staff user created successfully'
      redirect_to staff_users_path
    else
      flash[:notice] = @staff_user.errors.full_messages.join(",")
      redirect_to new_staff_user_path
    end
  end

  def edit
  end

  def update
    if(@staff_user.update(staff_user_params))
      flash[:notice] = 'Staff user updated successfully'
      redirect_to staff_users_path
    else
      flash[:notice] = @staff_user.errors.full_messages.join(",")
      redirect_to staff_user_path(@staff_user)
    end
  end

  def destroy
		if @staff_user.destroy
			flash[:notice] = 'Staff user deleted successfully'
		else
			flash[:notice] = @staff_user.errors.full_messages.join(",")
		end
		redirect_to staff_users_path
	end


  def find_staff_user
		@staff_user = Admin.staff_user.find_by id: params[:id]
		unless @staff_user
			flash[:notice] = "Staff user not found!!!"
			redirect_to staff_users_path
		end
	end
  def fetch_roles
		@roles = Role.where.not(id: 1).map{ |role| [role.name, role.id] }
	end

  def staff_user_params
		params.require(:staff_user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :role_id)
	end
end
