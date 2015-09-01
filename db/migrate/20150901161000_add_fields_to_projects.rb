class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :cop_num, :string
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date
    add_column :projects, :org, :string
    add_column :projects, :proj_type, :string
    add_column :projects, :funding, :decimal
  end
end
