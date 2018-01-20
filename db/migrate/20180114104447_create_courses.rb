class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course
      t.integer :price
      t.text :explanatory_text
      t.string :target_age
      t.string :class_time

      t.timestamps
    end
  end
end
