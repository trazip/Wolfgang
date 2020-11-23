class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.boolean :private
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
