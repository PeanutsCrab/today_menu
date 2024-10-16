class MenusController < ApplicationController
  include BreadcrumbsConcern
  skip_before_action :require_login, only: %i[top suggest show search]

  def top; end

  def index
    @menus = Menu.includes(:user).where(user_id: current_user.id).page(params[:page])
    set_breadcrumbs_index
  end

  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find(params[:id])
    set_breadcrumbs_show
  end

  def edit
    @menu = current_user.menus.find(params[:id])
    set_breadcrumbs_edit
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save_with_tags(tag_names: params.dig(:menu, :tag_names).split(',').uniq)
      redirect_to menus_path, success: t('defaults.flash_message.created', item: Menu.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Menu.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @menu = current_user.menus.find(params[:id])
    if @menu.save_with_tags(tag_names: params.dig(:menu, :tag_names).split(',').uniq)
      redirect_to menu_path(@menu), success: t('defaults.flash_message.updated', item: Menu.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Menu.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    menu = current_user.menus.find(params[:id])
    menu.destroy!
    redirect_to menus_path, success: t('defaults.flash_message.deleted', item: Menu.model_name.human)
  end

  def suggest
    @menus = Menu.order("RANDOM()").first # ランダムに献立を取得
  end

  def search
    @search_form = SearchMenusForm.new(search_menu_params)
    @search_results = @search_form.search
  end

  def likes
    @like_menus = current_user.likes_menus.includes(:user).page(params[:page])
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :material, :process, :menu_image, :menu_image_cache)
  end

  def search_menu_params
    params.fetch(:q, {}).permit(:name, :material, :tag_name)
  end
end