class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|

      t.timestamps
    end
  end
end
