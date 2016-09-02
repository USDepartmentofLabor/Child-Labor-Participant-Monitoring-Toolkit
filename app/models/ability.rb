class Ability < ActiveRecord::Base

  scope :has, -> (name) {where(:name => name)}

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

  def self.actions
    Ability.all.map(&:action).uniq
  end

  def self.categories
    Ability.all.group_by(&:category)
  end
end
