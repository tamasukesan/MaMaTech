class Course < ApplicationRecord

  has_many :class_courses
  has_many :classworks, through: :class_courses
  has_many :customers

end
