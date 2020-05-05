# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
          redirect_to '/'
      else
          render 'edit'
      end
  end
  def update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	    redirect_to '/', notice: 'プロフィールを更新しました'
    else
      render 'edit'
    end
  end

  # private
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end

  # def destroy
  #   user = User.find(params[:id])
  #   user.posts.map { |post| post.delete_with_image }
  #   user.destroy
  #   redirect_to '/'
  # end

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

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
