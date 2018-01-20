class CreateClassDays < ActiveRecord::Migration[5.1]
  def change
    create_table :class_days do |t|
      t.integer :classwork_id
      t.string :week
      t.string :start_time
      t.string :finish_time

      t.timestamps
    end
  end
end
