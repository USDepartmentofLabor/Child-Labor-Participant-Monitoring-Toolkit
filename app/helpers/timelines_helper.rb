module TimelinesHelper
  def determine_event_background_color(event_type)
    background_color = 'bg-red'

    if event_type == "INTAKE_DATE_STATUS"
      background_color = 'bg-blue'
    elsif event_type == "WORK_STATUS"
      background_color = 'bg-aqua'
    elsif event_type == "EDUCATION_STATUS"
      background_color = 'bg-yellow'
    elsif event_type == "SERVICE"
      background_color = 'bg-fuchsia'
    end

    background_color
  end

  def determine_event_icon(event_type)
    icon = "fa-ban"

    if event_type == "INTAKE_DATE_STATUS"
      icon = "fa-plus"
    elsif event_type == "WORK_STATUS"
      icon = "fa-briefcase"
    elsif event_type == "EDUCATION_STATUS"
      icon = "fa-graduation-cap"
    elsif event_type == "SERVICE"
      icon = "fa-cutlery"
    end

    icon
  end
end
