class CustomersController < ApplicationController

  def top
  end

  def school_details
  end

  def study
    @courses = Course.all
  end

  def price
    @courses = Course.all
  end

  def search
  end

  def create
    @customer = Customer.new(customer_params)
    @classwork = Classwork.find(@customer.classwork_id)
    if params[:back]
      render "classworks/show", {classwork: @classwork}
    elsif @customer.save
      NotificationMailer.send_when_create(@customer,@classwork).deliver_later
      # セッションをからにする
      session[:customer_all] = nil
      redirect_to complete_path
    else
      render "classworks/show", {classwork: @classwork}
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    # 遷移先のコントローラーとアクションを取得する記述。
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:action] == "show_customer"
    # Rails.logger.info(path[:action])
      redirect_to users_show_customer_path(current_user, params[:id])
    else
      redirect_to customer_path(params[:id])
    end
  end

  def confirm
    @customer = Customer.new(customer_params) # <=POSTされたパラメータを取得
    @classwork = Classwork.find(@customer.classwork_id)
    session[:customer_all] = customer_params
    render "classworks/show", {classwork: @classwork} if @customer.invalid? # <=バリデーションチェックNGなら戻す
  end

  private
  def customer_params
      params.require(:customer).permit(:classwork_id,
                                       :customer_first_name,
                                       :customer_last_name,
                                       :customer_first_name_kana,
                                       :customer_last_name_kana,
                                       :sex,
                                       :age_id,
                                       :course_id,
                                       :post_code,
                                       :region_key,
                                       :city,
                                       :street,
                                       :phone,
                                       :email,
                                       :contact,
                                       :pc,
                                       :parents_first_name,
                                       :parents_last_name,
                                       :parents_first_name_kana,
                                       :parents_last_name_kana,
                                       :remarks,
                                       :correspondence,
                                       :customer_status
                                       )
  end

end
