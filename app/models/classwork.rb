class Classwork < ApplicationRecord

  belongs_to :user
  belongs_to :region

  has_many :customers
  has_many :class_days, :dependent => :destroy
  has_many :class_courses, :dependent => :destroy
  has_many :courses, through: :class_courses

  accepts_nested_attributes_for :class_days, allow_destroy: true

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
