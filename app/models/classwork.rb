class Classwork < ApplicationRecord

  belongs_to :user
  belongs_to :region

  has_many :customers
  has_many :class_days, :dependent => :destroy
  has_many :class_courses, :dependent => :destroy
  has_many :courses, through: :class_courses

  accepts_nested_attributes_for :class_days, allow_destroy: true

  # 郵便番号頭３桁による絞り込み
  scope :post_code_first, ->(search) { where("classwork_post_code_first like ?", "#{search}%")}
  # 郵便番号おしり４桁による絞り込み
  scope :post_code_last, ->(search_last) { where("classwork_post_code_last like ?", "%#{search_last}%")}

  # 郵便番号３桁＋４桁の検索
  def self.post_code(search, search_last)
    post = post_code_first(search) + post_code_last(search_last)
    post.uniq
    # 重複するレコードがあれば削除メソッド
  end


  # accepts_nested_attributes_for :class_courses, allow_destroy: true

  attachment :teacher_image

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
