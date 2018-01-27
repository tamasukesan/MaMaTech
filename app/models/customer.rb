class Customer < ApplicationRecord
  enum sex: [ "男", "女" ]
  enum correspondence: [ "未対応", "対応済み" ]
  enum pc: [ "タブレット", "ノートPC", "両方持っている", "どちらも持っていない" ]

  belongs_to :classwork
  belongs_to :region
  belongs_to :course

  has_one :student
  has_many :user_customers


end
