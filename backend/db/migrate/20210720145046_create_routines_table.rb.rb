class CreateRoutinesTable.rb < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :type
      t.datetime :date
      t.integer :vehicle_id
    end
  end
end
