class AddDataToAnnotations < ActiveRecord::Migration[6.0]
  def change
    add_column :annotations, :data, :text
  end
end
