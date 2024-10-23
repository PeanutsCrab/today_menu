class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, success: t('users.create.success')
    else
      flash.now[:danger] = t('users.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    user.destroy!
    redirect_to root_path, success: t('defaults.flash_message.deleted', item: User.model_name.human)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end