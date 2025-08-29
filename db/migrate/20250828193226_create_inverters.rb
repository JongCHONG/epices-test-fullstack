class CreateInverters < ActiveRecord::Migration[8.0]
  def change
    create_table :inverters do |t|
      t.string :name

      t.timestamps
    end
  end
end
