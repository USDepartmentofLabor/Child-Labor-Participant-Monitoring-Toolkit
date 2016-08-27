class Ability < ActiveRecord::Base
  def display_name
    I18n.t "abilities.#{self.name}.name", default: "Unknown"
  end

  def description
    I18n.t "abilities.#{self.name}.desc", default: ""
  end

  def display_strings
    {
      display_name: self.display_name,
      description: self.description
    }
  end
end
