class AddIsBeneficiaryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :is_beneficiary, :boolean, default: false
  end
end
