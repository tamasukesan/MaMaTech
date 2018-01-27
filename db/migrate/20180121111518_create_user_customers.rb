class CreateUserCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_customers do |t|
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
