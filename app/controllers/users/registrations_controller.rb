module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_params, only: %i[update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    protected

    def configure_account_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number email])
    end
  end
end
