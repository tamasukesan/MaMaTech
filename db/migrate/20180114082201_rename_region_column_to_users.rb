class RenameRegionColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :region, :region_id
  end
end
