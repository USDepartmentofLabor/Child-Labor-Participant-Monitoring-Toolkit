class DropUnneededHazardousTables < ActiveRecord::Migration
  def change
    drop_table :follow_ups_abuses, force: :cascade
    drop_table :people_abuses, force: :cascade
    drop_table :abuses, force: :cascade
    drop_table :follow_ups_industries, force: :cascade
    drop_table :people_industries, force: :cascade
    drop_table :industries, force: :cascade
    drop_table :follow_ups_occupations, force: :cascade
    drop_table :people_occupations, force: :cascade
    drop_table :occupations, force: :cascade
  end
end
