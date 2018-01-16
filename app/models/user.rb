class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :registerable, :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :timeoutable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :abilities, through: :roles

  before_create -> { self.auth_token = SecureRandom.hex }

  validates :name, presence: true

  def has_ability? ability
    abilities.has(ability.to_s).count > 0
  end

  def has_role? role
    roles.has(role.to_s).count > 0
  end
end
