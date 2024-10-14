class LikesController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    current_user.likemenu(@menu)
  end

  def destroy
    @menu = current_user.likes.find(params[:id]).menu
    current_user.unlikemenu(@menu)
  end
end