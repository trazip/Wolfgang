class AddBioToComposers < ActiveRecord::Migration[6.0]
  def change
    add_column :composers, :bio, :string
  end
end
