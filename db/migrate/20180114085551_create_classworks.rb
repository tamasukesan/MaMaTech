class CreateClassworks < ActiveRecord::Migration[5.1]
  def change
    create_table :classworks do |t|
      t.integer :user_id
      t.string :classwork_post_code_first
      t.string :classwork_post_code_last
      t.integer :region_id
      t.string :classwork_city
      t.string :classwork_street
      t.string :classwork_phone
      t.string :classwork_email
      t.text :classwork_pr
      t.boolean :state
      t.string :teacher_image_id
      t.text :career

      t.timestamps
    end
  end
end
