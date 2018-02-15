class ClassCourse < ApplicationRecord
  belongs_to :classwork
  belongs_to :course


# 　ボツ１
  # def self.course_id_exist?(course)
  # 	self.all.each do |class_course|
  # 		if class_course.course_id == course.id
  # 			return "◯"
  # 		else
  # 			return "-"
  # 		end
  # 	end
  # end
# 　ボツ２
  # def course_id_exist?(course)
  # 	if self.where(course_id: course.id).exist?
  # 		return "○"
  # 	else
  # 		return "-"
  # 	end
  # end

end
