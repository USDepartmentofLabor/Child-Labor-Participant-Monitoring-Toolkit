class UpdateProjects < ActiveRecord::Migration
  def change

    remove_column :projects, :user_id, :integer
    remove_column :projects, :proj_type, :string
    remove_column :projects, :total_target_children, :integer
    rename_column :projects, :cop_num, :cooperative_agreement_number
    rename_column :projects, :org, :organization
    rename_column :projects, :funding, :funding_amount

  end
end
