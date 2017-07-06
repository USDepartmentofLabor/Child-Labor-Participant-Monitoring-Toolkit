class AddIsBirthdateApproximateToPeople < ActiveRecord::Migration
  def change
    add_column :people, :is_birthdate_approximate, :boolean
  end
end
