class CreateClassCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :class_courses do |t|
      t.integer :classwork_id
      t.integer :course_id

      t.timestamps
    end
  end
end
