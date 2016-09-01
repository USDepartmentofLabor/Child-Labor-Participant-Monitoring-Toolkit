class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :abilities, through: :roles

  validates :name, presence: true

  def has_ability? ability
    abilities.has(ability.to_s).count > 0
  end
end
