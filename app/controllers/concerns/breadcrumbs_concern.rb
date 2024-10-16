module BreadcrumbsConcern
  extend ActiveSupport::Concern

  def set_breadcrumbs_index
    case request.referer
    when new_menu_url
      @breadcrumbs = :menus_path_new
    else 
      @breadcrumbs = :menus_path
    end
  end

  def set_breadcrumbs_edit
    case request.referer
    when menus_url
      @breadcrumbs = :edit_menu_path
    else 
      @breadcrumbs = :edit_menu_path_show
    end
  end

  def referer_is_search_menus?
    request.referer && request.referer.include?("/menus/search") 
  end

  def set_breadcrumbs_show
    if referer_is_search_menus?
      @breadcrumbs = :menu_path_search # 検索結果
    elsif request.referer == suggest_menus_url
      @breadcrumbs = :menu_path_suggest # 献立提案
    elsif request.referer == edit_menu_url
      @breadcrumbs = :menu_path_edit # 献立編集
    elsif request.referer == likes_menus_url
      @breadcrumbs = :menu_path_like # お気に入り一覧
    else
      @breadcrumbs = :menu_path_menus # 献立一覧
    end
  end
end