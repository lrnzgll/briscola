class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references  :user
      t.references  :match
      t.integer     :initial_player_order
      t.integer     :score, default: 0

      t.timestamps
    end
  end
end
