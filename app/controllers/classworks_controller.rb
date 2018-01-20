class ClassworksController < ApplicationController
  before_action :authenticate_user!

  def new
    @classwork = Classwork.new
    @courses = Course.all
    @user = current_user
  end

  def create
    @user = current_user
    # has_oneなので、newを渡さずに、外部参照キーを自動でセットしてくる記述
    @classwork = @user.build_classwork(classwork_params)
    if @classwork.save
    #collection_check_boxesを使っているので今回は不要
    #course_idsの配列をバラして保存
    #   params.require(:classwork)[:course_ids].each do |i|
    #     @class_course = ClassCourse.new
    #     @class_course.classwork_id = @classwork.id
    #     @class_course.course_id = i
    #     @class_course.save
    #     # binding pry
    #   end
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
  end

  def show
  end

  private
  def classwork_params
      params.require(:classwork).permit(
                                        :classwork_post_code_first,
                                        :classwork_post_code_last,
                                        :region_key,
                                        :classwork_city,
                                        :classwork_street,
                                        :classwork_phone,
                                        :classwork_email,
                                        :classwork_pr,
                                        :state,
                                        :teacher_image,
                                        :career,
                                        :user_id,
                                        course_ids: [],
                                        class_days_attributes: [:id,
                                                                :classwork_id,
                                                                :week,
                                                                :start_time,
                                                                :finish_time,
                                                                :_destroy
                                        ]
                                        )
  end
end

# hash = {key1 => value1, ley2 => value2}
# hash[:key1] => "value1"


# <ActionController::Parameters {
#   "utf8"=>"✓", 
#   "authenticity_token"=>"dGCKlcDJvajibE4DAC9N1qi/U8wFlYbA04HIeJW5ARjCVptiA9ZnHrzvOutDVmvHc44MB7SJ3wcOTNrs9kJS3A==", 
#   "classwork"=><ActionController::Parameters {
#       "course_ids"=>["", "1", "2"], 
#       "classwork_phone"=>"08000000000", 
#       "classwork_email"=>"a@a", 
#       "classwork_post_code_first"=>"167", 
#       "classwork_post_code_last"=>"1670", 
#       "region_key"=>"東京都", 
#       "classwork_city"=>"杉並区荻窪", 
#       "classwork_street"=>"3-3-3", 
#       "teacher_image"=>"{}", 
#       "career"=>"aaaaa", 
#       "classwork_pr"=>"aaaa", 
#       "state"=>"1"
#       } 
#       permitted: false>, 
#         "開講時間"=>"18:00", 
#         "commit"=>"登録する", 
#         "controller"=>"classworks", 
#         "action"=>"create"} 
#         permitted: false>

