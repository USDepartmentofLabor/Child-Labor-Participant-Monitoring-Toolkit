class TimelineEvent
  attr_accessor :event_date, :type, :description, :notes

  def initialize(event_date = '', type = '', description = '', notes = '')
    @event_date = event_date
    @type = type
    @description = description
    @notes = notes
  end

end
