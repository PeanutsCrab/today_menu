class LikesController < ApplicationController
  def create
    menu = Menu.find(params[:menu_id])
    current_user.likemenu(menu)
    redirect_to likes_menus_path
  end

  def destroy
    menu = current_user.likes.find(params[:id]).menu
    current_user.unlikemenu(menu)
    redirect_to likes_menus_path, status: :see_other
  end
end