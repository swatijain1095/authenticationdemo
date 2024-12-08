class RolesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @roles = Role.all
  end
end
