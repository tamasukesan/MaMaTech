# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "csv"

CSV.foreach("db/region-utf8.csv", headers: true) do |info|
  Region.create(:region => info[1])
end

Age.create(:age_name => "0～1歳児")
Age.create(:age_name => "2歳児")
Age.create(:age_name => "幼児・年少")
Age.create(:age_name => "幼児・年中")
Age.create(:age_name => "幼児・年長")
Age.create(:age_name => "小学1年生")
Age.create(:age_name => "小学2年生")
Age.create(:age_name => "小学3年生")
Age.create(:age_name => "小学4年生")
Age.create(:age_name => "小学5年生")
Age.create(:age_name => "小学6年生")
Age.create(:age_name => "中学1年生")
Age.create(:age_name => "中学2年生")
Age.create(:age_name => "中学3年生")

Course.create(:course => 'タブレットプログラミングコース',:price => 7000, :explanatory_text => 'iPadのタッチ操作でシンプルなブロックを組み合わせることでプログラミングをします。マウス操作やキー操作が不要なため、幼稚園・保育園の年中程度から受講可能です。低学年のお子様でも楽しくプログラミングの基礎を学習して頂けますので、Scratchコースへのステップアップにオススメです。', :target_age => '年長〜小４', :class_time => '週１回 ４０分')
Course.create(:course => 'Scratchプログラミングコース',:price => 11000, :explanatory_text => 'Scratch（スクラッチ）というマサチューセッツ工科大学が作ったソフトを利用して、プログラミングの考え方を学びます。ブロックをパズルのように組み合わせ、ゲームを作ります。プログラミングの考え方を学ぶ入門講座です。', :target_age => '小３〜中３', :class_time => '週１回 ６０分')

Info.create(:info_contents => "1月の講習会を開催します！", :create_day => "2017/12/15")
Info.create(:info_contents => "2月の講習会を開催します！", :create_day => "2018/01/15")
Info.create(:info_contents => "3月の講習会を開催します！", :create_day => "2018/02/15")

# 47.times do |number|
#   User.create(:email => "#{number}@a",
#               :first_name => "沙織",
#               :last_name => "島貫",
#               :first_name_kana => "サオリ",
#               :last_name_kana => "シマヌキ",
#               :post_code => "1670051",
#               :region_id => rand(1..47),
#               :city => "杉並区荻窪",
#               :street => "1-1-1",
#               :phone => "08000000000",
#               :user_status => true,
#               :password => "11111#{number}",
#               :password_confirmation => "11111#{number}"
#               )
# end

# Classwork.create(:user_id => 1, :classwork_post_code_first => "000", :classwork_post_code_last => "0000", :region_id => 1, :classwork_city => "あああ", :classwork_street => "あああ", :classwork_phone => "08000000000", :classwork_email => "a@a.a", :classwork_pr => "あああ", :state => true, :career => "あああ")

# 47.times do |number|
#   Classwork.create(:user_id => rand(1..47),
#                   :classwork_post_code_first => rand(167..989),
#                   :classwork_post_code_last => rand(0051..2431),
#                   :region_id => rand(1..47),#１から４７の数字をランダムで持ってくる
#                   :classwork_city => "#{number}",
#                   :classwork_street => "#{number}",
#                   :classwork_phone => "#{number}",
#                   :classwork_email => "#{number}@a",
#                   :classwork_pr => "#{number}",
#                   :state => true,
#                   :career => "#{number}",
#                   )
# end

# 47.times do |number|
#   ClassCourse.create(:classwork_id => (1..47),
#                      :course_id => (1..2),
#                      )
# end

# 47.times do |number|
#   ClassDay.create(:classwork_id => (1..47),
#                   :week => "月",
#                   :start_time => "12:00:00",
#                   :finish_time => "18:00:00"
#                  )
# end

# 10.times do |number|
#   Customer.create(:classwork_id => 1,
#   	              :customer_first_name => "たま #{number}",
#   	              :customer_last_name => "佐藤 #{number}",
#   	              :customer_first_name_kana => "タマ#{number}",
#   	              :customer_last_name_kana => "サトウ#{number}",
#   	              :sex => "男",
#   	              :age => "#{number}",
#   	              :course_id => 1,
#   	              :post_code => "#{number}",
#   	              :region_id => rand(1..47),#１から４７の数字をランダムで持ってくる
#   	              :city => "#{number}",
#   	              :street => "#{number}",
#   	              :phone => "#{number}",
#   	              :email => "#{number}",
#   	              :contact => "#{number}",
#   	              :pc => "タブレット",
#   	              :parents_first_name => "たま#{number}",
#   	              :parents_last_name => "佐藤#{number}",
#   	              :parents_first_name_kana => "タマ#{number}",
#   	              :parents_last_name_kana => "サトウ#{number}",
#   	              :remarks => "#{number}",
#   	              :correspondence => "未対応",
#   	              :customer_status => true
#   	              )
# end


