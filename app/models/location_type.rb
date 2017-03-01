class LocationType < ActiveRecord::Base
  def self.for_select
    l = LocationType.all.map do |l|
      {
        value: l.id,
        text: l.name
      }
    end

    l.prepend({value:'', text:''})
    l.prepend({value:'', text:'Please Select'})
  end
end
