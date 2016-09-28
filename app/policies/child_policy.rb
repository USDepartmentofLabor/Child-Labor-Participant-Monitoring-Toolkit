class ChildPolicy < ApplicationPolicy
  def index?   ; user.has_ability? :child_index   ; end
  def show?    ; user.has_ability? :child_show    ; end
  def create?  ; user.has_ability? :child_create  ; end
  def edit?    ; user.has_ability? :child_edit    ; end
  def destroy? ; user.has_ability? :child_destroy ; end
end
