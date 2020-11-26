class RemoveColumnFromComposer < ActiveRecord::Migration[6.0]
  def change
    remove_column :composers, :bio, :string
  end
end
