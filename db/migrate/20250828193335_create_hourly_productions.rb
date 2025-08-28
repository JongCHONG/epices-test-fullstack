class CreateHourlyProductions < ActiveRecord::Migration[8.0]
  def change
    create_table :hourly_productions do |t|
      t.references :inverter, null: false, foreign_key: true
      t.date :date
      t.integer :hour
      t.float :energy

      t.timestamps
    end
  end
end
