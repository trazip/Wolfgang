class AddUserAndScoreToCollaborations < ActiveRecord::Migration[6.0]
  def change
    add_reference :collaborations, :user, index: true
    add_reference :collaborations, :score, index: true
  end
end
