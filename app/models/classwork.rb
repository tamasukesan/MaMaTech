class Classwork < ApplicationRecord

  belongs_to :user
  belongs_to :region

  has_many :customers
  has_many :class_days, :dependent => :destroy
  has_many :courses

end
