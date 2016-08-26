class ChildPolicy < ApplicationPolicy
  def index?   ; user.has_ability? :index_child   ; end
  def show?    ; user.has_ability? :show_child    ; end
  def create?  ; user.has_ability? :create_child  ; end
  def update?  ; user.has_ability? :update_child  ; end
  def destroy? ; user.has_ability? :destroy_child ; end
end
