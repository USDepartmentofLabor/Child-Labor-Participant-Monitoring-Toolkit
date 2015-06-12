class CreateEducationStatuses < ActiveRecord::Migration
  def change
    create_table :education_statuses do |t|
      t.string :name
    end
  end
end
