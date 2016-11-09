class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :code, :null => false, :default => 'NOT SET'
      t.string :name, :null => false, :default => 'NOT SET'
    end
  end
end
