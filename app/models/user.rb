class User < ApplicationRecord
  attr_accessor :region_key
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # authentication_keys: [:region_key]
         # ログインのとき追加したいなら記述
  has_one :classwork, :dependent => :destroy
  has_many :user_customers
  has_many :students
  belongs_to :region
  before_validation :region_to_id,if: :region_exist?

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :city, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }

  # バリデーションを行う前に実行したい処理をかける。
  # region_exist?がtrueの時、region_to_idをバリデーションを行う前に実行


# ログインのときregion_keyを追加したいなら記述
  # def self.find_first_by_auth_conditions(warden_conditions)
	 #  conditions = warden_conditions.dup
	 #  if region_key = conditions.delete(:region_key)
	 #    where(conditions).where(["region_id = :region_id", { :region_id => region_id }]).first
	 #  else
	 #    where(conditions).first
	 #  end
  # end

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
