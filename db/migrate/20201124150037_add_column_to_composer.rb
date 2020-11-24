class AddColumnToComposer < ActiveRecord::Migration[6.0]
  def change
    add_column :composers, :name, :string

  end
end
