class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :customer_id
      t.integer :student_status

      t.timestamps
    end
  end
end
