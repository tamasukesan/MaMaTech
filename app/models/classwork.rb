class Classwork < ApplicationRecord

  belongs_to :user
  belongs_to :region

  has_many :customers
  has_many :class_days, :dependent => :destroy
  has_many :class_courses, :dependent => :destroy
  has_many :courses, through: :class_courses

  geocoded_by :address
  after_validation :geocode

  attachment :teacher_image

  validates :classwork_post_code_first, presence: true, format: { with: /\A\d{3}\z/ }
  validates :classwork_post_code_last, presence: true, format: { with: /\A\d{4}\z/ }
  validates :region_key, :classwork_city, :classwork_pr, :career, presence: true
  validates :classwork_phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :classwork_email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :course_ids, :class_days, presence: true

  accepts_nested_attributes_for :class_days, allow_destroy: true

  # 郵便番号頭３桁による絞り込み
  scope :post_code_first, ->(search_post_first) { where(["classwork_post_code_first like ? and state = ? ", "#{search_post_first}%",true]) }
  # 郵便番号おしり４桁による絞り込み
  scope :post_code_last, ->(search_post_last) { where(["classwork_post_code_last like ? and state = ? ", "%#{search_post_last}%",true]) }

  # 郵便番号３桁＋４桁の検索
  def self.post_code(search, search_last)
    post = post_code_first(search) + post_code_last(search_last)
    post.uniq
    # 重複するレコードがあれば削除メソッド
  end

  # searchで都道府県をクリツクして渡るparamsをregionテーブルから探しIDを探す。そしてclasswarkのregion_idの中から検索する。
  scope :region_search, ->(search_region) { where(["classworks.region_id = (select regions.id from regions where region = ?) and state = ? ", "#{search_region}",true]) }

  # # 都道府県＋市区町村＋丁目番地以下を結合させたメソッド
  attr_accessor :address
  # before_save :concat_address
  # def concat_address
  #   return address = [region.region,classwork_city,classwork_street].join('')
  # end

  # accepts_nested_attributes_for :class_courses, allow_destroy: true


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
