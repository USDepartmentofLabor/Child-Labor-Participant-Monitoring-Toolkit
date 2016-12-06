class IntakeActor < ActiveRecord::Base
  belongs_to :household
  belongs_to :intake_actor_type
end
