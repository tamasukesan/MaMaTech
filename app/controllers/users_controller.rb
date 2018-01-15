class UsersController < ApplicationController

  def edit

  end

  def update

  end

  def destroy

  end

  def show
  	@user = User.find(params[:id])
  end

  def manage_customer

  end

  def show_customer

  end

  def edit_customer_details

  end

end
