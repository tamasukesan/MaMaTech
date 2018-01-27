class StudentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @student = Student.new
    @customer = Customer.find(params[:student][:customer_id])
    @user = User.find(params[:student][:user_id])
    @student.customer_id = @customer.id
    @student.user_id = @user.id
    @student.student_status = 0
    @student.save
    @customer.update_attribute(:customer_status, false)
    redirect_to students_path
  end

  # def edit

  # end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(params[:id])
  end

  def index
    @user = current_user
    @students = @user.students.all
  end

  def show
    @student = Student.find(params[:id])
  end

  private
  def student_params
      params.require(:student).permit(:customer_id,
                                      :user_id,
                                      :student_status,
                                      )
  end
end
