class DeleteColumnFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :scores, :composer, :string
  end
end
