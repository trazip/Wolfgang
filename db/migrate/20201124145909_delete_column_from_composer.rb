class DeleteColumnFromComposer < ActiveRecord::Migration[6.0]
  def change
    remove_column :composers, :first_name, :string
    remove_column :composers, :last_name, :string
  end
end
