class CreateSuit < ActiveRecord::Migration[6.0]
  def change
    create_table :suits do |t|
      t.string :suit_name, null: false
      t.string :image
      t.timestamps
    end
  end
end
