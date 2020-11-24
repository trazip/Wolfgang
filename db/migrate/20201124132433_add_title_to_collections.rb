class AddTitleToCollections < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :title, :string
  end
end
