# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
    # def new
    #     super 
    #     resource.is_admin = true
    #     resource.save
    # end

  # POST /resource
    # def create
    #     super do
    #         resource.is_admin = true
    #         resource.save
    #     end
    # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, 
                                          keys: [:name, :username, :email, :password, :description, :phone_number])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
    def after_sign_up_path_for(_resource)
        if _resource.email.ends_with?("@truequesuc.com")
            _resource.is_admin = true
            _resource.save
        end
        root_path
    end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
