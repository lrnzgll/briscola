class CreateDeal < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :match
      t.datetime   :start_time
      t.datetime   :end_time
      t.string     :result

      t.timestamps
    end
  end
end
