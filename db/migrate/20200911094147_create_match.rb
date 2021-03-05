class CreateMatch < ActiveRecord::Migration[6.0]
  def change
    create_table :matches, id: :uuid do |t|

      t.timestamps
    end
  end
end

