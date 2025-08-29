class RemoveNameFromInverters < ActiveRecord::Migration[8.0]
  def change
    remove_column :inverters, :name, :string
  end
end
