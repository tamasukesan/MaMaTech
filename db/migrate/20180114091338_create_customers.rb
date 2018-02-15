class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :classwork_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_first_name_kana
      t.string :customer_last_name_kana
      t.integer :sex, default: 0, null: false, limit: 1
      t.integer :age_id
      t.integer :course_id
      t.string :post_code
      t.integer :region_id
      t.string :city
      t.string :street
      t.string :phone
      t.string :email
      t.integer :contact, default: 0, null: false, limit: 1
      t.integer :pc, default: 0, null: false, limit: 1
      t.string :parents_first_name
      t.string :parents_last_name
      t.string :parents_first_name_kana
      t.string :parents_last_name_kana
      t.text :remarks
      t.integer :correspondence, default: 0, null: false, limit: 1
      t.boolean :customer_status, null: false, default: true

      t.timestamps
    end
  end
end
