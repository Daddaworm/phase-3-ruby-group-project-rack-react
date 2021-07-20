class CreateVehicleTable.rb < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :vin
      t.integer :mileage
      t.string :oil_type
      t.string :oil_qty
      t.string :oil_filter
      t.integer :owner_id
    end
  end
end
