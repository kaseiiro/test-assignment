class CreateOskills < ActiveRecord::Migration
  def change
    create_table :oskills do |t|
      t.string :description
      t.references :occupant

      t.timestamps
    end
    add_index :oskills, :occupant_id
  end
end
