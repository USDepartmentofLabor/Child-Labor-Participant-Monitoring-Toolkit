class AddCurrencyToIncomeSources < ActiveRecord::Migration
  def change
    add_column :income_sources, :currency, :string
  end
end
