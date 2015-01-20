class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :hide_sign_in_link

  protected

  def hide_sign_in_link
    @hide_sign_in_link = true
  end

  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name,
		               :last_name, :credit_card, :credit_card_type, address: [:street_name, :apt, :city,
					   :state_abbrv, :zip_code]) }

	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name,
						:last_name, :credit_card, :credit_card_type, address: [:street_name, :apt, :city,
			            :state_abbrv, :zip_code]) }

    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
