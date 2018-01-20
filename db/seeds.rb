# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Course.create(:course => 'タブレットプログラミングコース',:price => 7000, :explanatory_text => '説明文です。', :target_age => '年長〜小４', :class_time => '週１回 ４０分')
Course.create(:course => 'Scratchプログラミングコース',:price => 11000, :explanatory_text => '説明文です。', :target_age => '小３〜中３', :class_time => '週１回 ６０分')

User.create(:email => 'a@a',:first_name => '沙織', :last_name => '島貫', :first_name_kana => 'サオリ', :last_name_kana => 'シマヌキ', :post_code => '1670051', :region_id => 13, :city => '杉並区荻窪', :street => '1-1-1', :phone => '08000000000', :user_status => false, :password => '111111', :password_confirmation => '111111')
#user = User.new:email => 'a@a',:first_name => '沙織', :last_name => '島貫', :first_name_kana => 'サオリ', :last_name_kana => 'シマヌキ', :post_code => '1670051', :region_id => 13, :city => '杉並区荻窪', :street => '1-1-1', :phone => '08000000000', :user_status => false, :password => '111111')
#user.save!

require "csv"

CSV.foreach('db/region-utf8.csv', headers: true) do |info|
  Region.create(:region => info[1])
end