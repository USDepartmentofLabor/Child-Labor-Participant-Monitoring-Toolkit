class TimelinesController < ApplicationController

  def index
    @child = Child.find(params[:child_id])
    @events = Array.new
    @child.statuses.each do |status|
      if status.work_status
        @events << TimelineEvent.new(status.start_date, 'WORK_STATUS', status.work_status.name, status.note)
      end

      if status.education_status
        @events << TimelineEvent.new(status.start_date, 'EDUCATION_STATUS', status.education_status.name, status.note)
      end
    end
    @child.service_instances.each do |service|
      @events << TimelineEvent.new(service.start_date, 'SERVICE', service.service.name, service.notes)
    end
    @events.sort! {|left, right| right.event_date <=> left.event_date}
    @events.push(TimelineEvent.new(@child.intake_date, 'INTAKE_DATE_STATUS', 'Intake Date', ''))
  end
end
