class AddAbilitiesToRole < ActiveRecord::Migration
  def change
    add_column :roles, :abilities, :text, array: true, default: []
  end
end
