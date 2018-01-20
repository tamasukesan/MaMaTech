class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                                       :first_name,
      	                                               :last_name,
      	                                               :first_name_kana,
      	                                               :last_name_kana,
      	                                               :post_code,
      	                                               :region_key,
      	                                               :city,
      	                                               :street,
      	                                               :phone,
      	                                               :user_status])
  end
end