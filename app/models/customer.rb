class Customer < ApplicationRecord
  enum sex: [ "男", "女" ]
  enum correspondence: [ "未対応", "対応済み" ]
  enum pc: [ "タブレット", "ノートPC", "両方持っている", "どちらも持っていない" ]
  enum contact: [ "電話", "メール", "どちらでもよい" ]

  belongs_to :classwork
  belongs_to :region
  belongs_to :course
  belongs_to :age

  has_one :student
  has_many :user_customers

  validates :customer_first_name,
            :customer_last_name,
            :customer_first_name_kana,
            :customer_last_name_kana,
            :age_id,
            :city,
            :parents_first_name,
            :parents_last_name,
            :parents_first_name_kana,
            :parents_last_name_kana,
            presence: true
  validates :customer_first_name_kana,
            :customer_last_name_kana,
            :parents_first_name_kana,
            :parents_last_name_kana,
            format:{ with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,
            message: '全角カナで入力して下さい' }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }


  attr_accessor :region_key
  before_validation :region_to_id,if: :region_exist?

  private

  def region_exist?
  	region_key.present?
  	# リージョンキー（フォームからくる内容）が存在するか判定
  end

  def region_to_id
  	Rails.logger.info(region_key)
  	region = Region.where(region: region_key).first
  	self.region_id = region.id
  	# リージョンキーとRegionモデルのカラムであるregionが一致するものをregionに代入
  	# whereだと配列がくるので、firstメソッドでインスタンス化
  	# 見つけてきたregionのインスタンスのidをUserのカラムである、region_idに代入
  end


end
