class AddCategoryAndActionToAbility < ActiveRecord::Migration
  def change
    add_column :abilities, :category, :string
    add_column :abilities, :action, :string
  end
end
