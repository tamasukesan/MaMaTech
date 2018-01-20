class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
    @region = Region.find(@user.region_id).region
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy

  end

  def show
  	@user = User.find(params[:id])
    @classwork = @user.classwork
    @course = ClassCourse.where(classwork_id: @classwork)
  end

  def manage_customer

  end

  def show_customer

  end

  def edit_customer_details

  end

  private
  def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :region_key, :city, :street, :phone, :user_status)
  end

end
