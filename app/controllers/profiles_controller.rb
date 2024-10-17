class ProfilesController < ApplicationController
before_action :set_user, only: [:edit, :update]

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, success: t('defaults.flash_message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:email)
  end
end