class Region < ApplicationRecord

  has_many :users
  has_many :classworks
  has_many :customers

end
