class ClassDay < ApplicationRecord

  belongs_to :classwork

  validates :week, :start_time, :finish_time, presence: true

end
