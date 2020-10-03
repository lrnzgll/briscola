class CreateRank < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :rank_name, null: false

      t.timestamps
    end
  end
end
