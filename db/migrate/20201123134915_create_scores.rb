class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :title
      t.string :composer
      t.string :genre
      t.integer :score_creation_date
      t.boolean :annotate
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
