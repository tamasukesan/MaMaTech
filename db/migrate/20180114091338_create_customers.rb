class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :classwork_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_first_name_kana
      t.string :customer_last_name_kana
      t.integer :sex
      t.string :age
      t.integer :applicant_course
      t.string :post_code
      t.integer :region_id
      t.string :city
      t.string :street
      t.string :phone
      t.string :email
      t.integer :contact
      t.integer :pc
      t.string :parents_first_name
      t.string :parents_last_name
      t.string :parents_first_name_kana
      t.string :parents_last_name_kana
      t.text :remarks
      t.integer :correspondence
      t.boolean :customer_status, default: true

      t.timestamps
    end
  end
end
