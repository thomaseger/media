class RegistrationsController < Devise::RegistrationsController

  def update
    account_update_params = params.require(:user).permit(:email, :password, :password_confirmation, :name)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      
      set_flash_message :notice, :updated

      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
    end

    render :edit
  end

end
