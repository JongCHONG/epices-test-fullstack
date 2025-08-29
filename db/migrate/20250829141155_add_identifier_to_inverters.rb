class AddIdentifierToInverters < ActiveRecord::Migration[8.0]
  def change
    add_column :inverters, :identifier, :string
  end
end
