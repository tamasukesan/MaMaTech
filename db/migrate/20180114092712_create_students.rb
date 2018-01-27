class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :customer_id
      t.integer :user_id
      t.integer :student_status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
