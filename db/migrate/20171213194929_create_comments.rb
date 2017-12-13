class CreateComments < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto'

    create_table :comments, id: false do |t|
      t.primary_key :id, :uuid, default: 'gen_random_uuid()'
      t.references :parent, type: :uuid, polymorphic: true, index: true
      t.string :body, null: false
      t.string :author, null: false
      t.timestamp :submitted_at, null: false
      t.timestamps null: false
    end
  end
end
