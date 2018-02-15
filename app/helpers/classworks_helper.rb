module ClassworksHelper

# 　courseテーブルにあるidがclassworkに紐づくClass_courseのcourse_idにあるか判断するメソッド
# 　もしcourseが持つidとclass_courseがもつcourse_idが一致すれば○。しなければ空欄。
  def course_id_present?(course, class_courses)
	  	if class_courses.where(course_id: course.id).present?
	  		return "○"
	  	else
	  		return ""
	  	end
	end

# # セッションの中身を取り出す時のメソッド
#   def customer(col)
#     session["customer_all"]["#{col}"]
#   end

end
