class AddCountryToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :country, :string, limit: 2
  end
end
