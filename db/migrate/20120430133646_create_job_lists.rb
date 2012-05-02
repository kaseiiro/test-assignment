class CreateJobLists < ActiveRecord::Migration
  def change
    create_table :job_lists do |t|
      t.string :title
      t.date :add
      t.date :expire
      t.integer :salary
      t.string :contacts

      t.timestamps
    end
  end
end
