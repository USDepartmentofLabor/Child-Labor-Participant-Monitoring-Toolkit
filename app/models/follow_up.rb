class FollowUp < ActiveRecord::Base
    belongs_to :person
    belongs_to :occupation
    belongs_to :work_status
    belongs_to :education_status
    has_and_belongs_to_many :work_activities
    has_and_belongs_to_many :occupations, :join_table => :follow_ups_occupations
    has_and_belongs_to_many :industries, :join_table => :follow_ups_industries
    has_and_belongs_to_many :hazardous_conditions, :join_table => :follow_ups_hazardous_conditions
    has_and_belongs_to_many :abuses, :join_table => :follow_ups_abuses
    has_and_belongs_to_many :household_tasks, :join_table => :follow_ups_household_tasks

    def reporting_period
      ReportingPeriod.where('start_date <= ? and end_date >= ?', follow_date, follow_date).first
    end

    def work_activities_names
      if work_activities
        return work_activities.map(&:display_name).join(', ')
      end
    end

    def hazardous_conditions_names
      if hazardous_conditions
        return hazardous_conditions.map(&:display_name).join(', ')
      end
    end

    def household_tasks_names
      if household_tasks
        return household_tasks.map(&:display_name).join(', ')
      end
    end
end
