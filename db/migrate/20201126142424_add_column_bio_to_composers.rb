class AddColumnBioToComposers < ActiveRecord::Migration[6.0]
  def change
    add_column :composers, :bio, :text
  end
end
