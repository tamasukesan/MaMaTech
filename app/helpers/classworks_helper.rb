module ClassworksHelper
	def format_phone(str)
    return str if str.blank?

    case str.size
    when 10
      str.gsub(/(\d{2})(\d{4})(\d{4})/, '\1-\2-\3')
    when 11
      str.gsub(/(\d{3})(\d{4})(\d{4})/, '\1-\2-\3')
    else
      str
    end
  end

# 　courseテーブルにあるidがclassworkに紐づくClass_courseのcourse_idにあるか判断するメソッド
  def course_id_present?(course, class_courses)
	  	if class_courses.where(course_id: course.id).present?
	  		return "○"
	  	else
	  		return ""
	  	end
	end
end
