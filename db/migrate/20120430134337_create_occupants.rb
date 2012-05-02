class CreateOccupants < ActiveRecord::Migration
  def change
    create_table :occupants do |t|
      t.string :namae
      t.string :contacts
      t.integer :status
      t.integer :salary

      t.timestamps
    end
  end
end
