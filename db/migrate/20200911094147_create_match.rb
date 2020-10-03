class CreateMatch < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user
      t.string :match_result
      t.string :name

      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end