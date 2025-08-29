class CreateDailyProductions < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_productions do |t|
      t.date :date
      t.float :total_energy

      t.timestamps
    end
  end
end
