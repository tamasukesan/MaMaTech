class Customer < ApplicationRecord

  belongs_to :classwork
  belongs_to :region

  has_one :student


end
