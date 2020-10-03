class CreateDealOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_orders do |t|
      t.references :participant
      t.references :deal
      t.integer :player_order

      t.timestamps
    end
  end
end
