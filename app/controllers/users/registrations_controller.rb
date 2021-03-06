# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @area = @user.build_area
    render :new_area
  end

  def create_area
    @user = User.new(session["devise.regist_data"]["user"])
    @area = Area.new(area_params)
      unless @area.valid?
        render :new_area and return
      end
    @user.build_area(@area.attributes)
    session["area"] = @area.attributes
    @image = @user.build_image
    render :new_image
  end

  def create_image
    @user = User.new(session["devise.regist_data"]["user"])
    @area = Area.new(session["area"])
    @image = Image.new(image_params)
      unless @image.valid?
        render :new_image and return
      end
    @user.build_area(@area.attributes)
    @user.save
    @image.user_id = @user.id
    @image.save
    session["devise.regist_data"]["user"].clear
    session["area"].clear
    sign_in(:user, @user)
    redirect_to tweets_path
  end

  private

 def area_params
   params.require(:area).permit(:country_id, :state, :language_id)
 end

 def image_params
  params.require(:image).permit(:image, :introduction)
 end


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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
