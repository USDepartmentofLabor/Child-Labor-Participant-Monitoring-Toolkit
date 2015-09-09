class AddOfficeAddressToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :office_address, :string
  end
end
