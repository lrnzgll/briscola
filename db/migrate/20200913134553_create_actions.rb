class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.references :deal
      t.references :participant
      t.references :card
      t.references :action_type
      t.string     :order

      t.timestamps
    end
  end
end
