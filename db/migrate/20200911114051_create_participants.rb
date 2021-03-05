class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references  :user
      t.references  :match, type: :uuid
      t.integer     :initial_player_order

      t.timestamps
    end
  end
end
