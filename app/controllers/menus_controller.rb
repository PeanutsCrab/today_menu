class MenusController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top; end

  def index
    @menus = Menu.includes(:user).where(user_id: current_user.id)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      redirect_to menus_path, success: t('defaults.flash_message.created', item: Menu.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Menu.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :material, :process)
  end
end