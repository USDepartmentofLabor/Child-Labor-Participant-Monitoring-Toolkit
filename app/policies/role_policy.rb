class RolePolicy < ApplicationPolicy
  def index?   ; user.has_ability? :role_index   ; end
  def create?  ; user.has_ability? :role_create  ; end
  def edit?    ; user.has_ability? :role_edit    ; end
  def destroy? ; user.has_ability? :role_destroy ; end
end
