class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :service_type
      t.integer :vehicle_id
      t.timestamps
    end
  end
end
