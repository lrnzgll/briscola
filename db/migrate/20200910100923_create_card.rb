class CreateCard < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_name
      t.references :suit
      t.references :rank

      t.timestamps
    end
  end
end
