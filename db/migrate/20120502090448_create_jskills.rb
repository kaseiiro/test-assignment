class CreateJskills < ActiveRecord::Migration
  def change
    create_table :jskills do |t|
      t.string :description
      t.references :job_list

      t.timestamps
    end
    add_index :jskills, :job_list_id
  end
end
