class Student < ApplicationRecord
  enum student_status: [ "学習中", "卒業", "保留" ]

  belongs_to :customer
  belongs_to :user

end
