class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :abilities

  scope :has, -> (name) {where(:name => name)}
end
