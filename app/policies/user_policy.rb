class UserPolicy < ApplicationPolicy
  def index?   ; user.has_ability? :user_index   ; end
  def create?  ; user.has_ability? :user_create  ; end
  def edit?    ; user.has_ability? :user_edit    ; end
  def destroy? ; user.has_ability? :user_destroy ; end
end
