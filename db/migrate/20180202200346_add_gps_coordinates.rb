class AddGpsCoordinates < ActiveRecord::Migration
  def change
    add_column :households, :latitude, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :longitude, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :position_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :altitude, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :altitude_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :heading, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :speed, :decimal, {:precision=>10, :scale=>7}
    add_column :households, :gps_recorded_at, :datetime
    add_column :people, :latitude, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :longitude, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :position_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :altitude, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :altitude_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :heading, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :speed, :decimal, {:precision=>10, :scale=>7}
    add_column :people, :gps_recorded_at, :datetime
    add_column :follow_ups, :latitude, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :longitude, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :position_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :altitude, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :altitude_accuracy, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :heading, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :speed, :decimal, {:precision=>10, :scale=>7}
    add_column :follow_ups, :gps_recorded_at, :datetime
  end
end