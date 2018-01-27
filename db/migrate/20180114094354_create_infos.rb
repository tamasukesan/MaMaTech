class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.text :info_contents
      t.text :create_day

      t.timestamps
    end
  end
end
