class MenusController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top; end

  def index
    @Menus = Menu.includes(:user).where(user_id: current_user.id)
  end

  def new
    @Menus = Menu.new
  end
end