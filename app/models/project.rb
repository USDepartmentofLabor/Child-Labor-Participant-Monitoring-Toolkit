class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :projects_children, dependent: :destroy
  has_many :children, through: :projects_children

  has_many :reports

  has_many :indicators

  has_many :services

  has_many :project_regions, dependent: :destroy

  has_many :project_user

  has_many :roles, through: :project_user

  has_many :users, through: :project_user

  accepts_nested_attributes_for :project_regions, allow_destroy: true, reject_if: :all_blank

  after_create :generate_common_indicators

  after_commit :check_defaults, on: :create

  def generate_common_indicators
    Indicator.create_common_indicators(self.id, self.user_id)
  end

  def check_defaults
    return true if self.id > 1

    # load default work status for the first time
    begin
      DBMS::DefaultData::Loader.load
    rescue DBMS::DefaultData::DataAlreadyLoaded => error
      return true
    end
  end
end
