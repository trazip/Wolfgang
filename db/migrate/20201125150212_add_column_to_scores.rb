class AddColumnToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :page_count, :integer
  end
end
