class Project < ActiveRecord::Base
  validates :name, presence: true

  after_create :generate_common_indicators

  #after_commit :check_defaults, on: :create

  def generate_common_indicators
    Indicator.create_common_indicators()
  end

  #def check_defaults
  #  return true if self.id > 1

    # load default work status for the first time
  #  begin
  #    DBMS::DefaultData::Loader.load
  #  rescue DBMS::DefaultData::DataAlreadyLoaded => error
  #    return true
  #  end
  #end
end
