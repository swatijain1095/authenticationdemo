class ProductPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def initialize(admin, record)
    @admin = admin
    @record = record
  end

  def create_product?
  	#1 means can add product
    admin.super_admin? || admin.role.permission_ids.include?(1)
  end

  def update_product?
  	#2 means can update product
    admin.super_admin? || admin.role.permission_ids.include?(2)
  end

  def delete_product?
  	#3 means can delete product
    admin.super_admin? || admin.role.permission_ids.include?(3)
  end

  def view_product?
  	#4 means can view product
    admin.super_admin? || admin.role.permission_ids.include?(4)
  end
end
