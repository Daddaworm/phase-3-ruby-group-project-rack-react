class CreateOwnerTable.rb < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :password
      t.string :email
    end
  end
end
