class ApplicationController < ActionController::Base
    # before_action :authenticate_client!
    before_action :set_current_client

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    private
    def set_current_client
        @client = current_client
    end
end