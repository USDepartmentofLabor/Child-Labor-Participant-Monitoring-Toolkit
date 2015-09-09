class RemoveCountryFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :country, :string, limit: 2
  end
end
