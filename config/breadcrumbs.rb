crumb :root do
  link "Home", root_path
end
# homeから遷移
crumb :suggest_menus do
  link '献立提案', suggest_menus_path
  parent :root
end

crumb :search_menus_path do
  link '検索結果', search_menus_path
  parent :root
end

crumb :login_path do
  link 'ログイン', login_path
  parent :root
end

crumb :new_user_path do
  link '会員登録', new_user_path
  parent :root
end

crumb :new_menu_path do 
  link '献立投稿', new_menu_path
  parent :root
end

crumb :likes_menus_path do
  link 'お気に入り一覧', likes_menus_path
  parent :root
end

crumb :privacy_path do
  link 'プライバシーポリシー', privacy_path
  parent :root
end

crumb :terms_path do
  link '利用規約', terms_path
  parent :root
end

# 投稿編集
crumb :edit_menu_path do
  link '献立編集', edit_menu_path
  parent :menus_path
end

crumb :edit_menu_path_show do
  link '献立編集', edit_menu_path
  parent :menu_path_menus
end

# 投稿一覧
crumb :menus_path do
  link '投稿一覧', menus_path
  parent :root
end

crumb :menus_path_new do
  link '投稿一覧', menus_path
  parent :new_menu_path
end

# 献立詳細
crumb :menu_path_search do
  link '献立詳細', menu_path
  parent :search_menus_path # 検索結果
end

crumb :menu_path_suggest do
  link '献立詳細', menu_path
  parent :suggest_menus # 献立提案
end

crumb :menu_path_edit do
  link '献立詳細', menu_path
  parent :edit_menu_path  # 献立編集
end

crumb :menu_path_menus do
  link '献立詳細', menu_path
  parent :menus_path # 献立一覧
end

crumb :menu_path_like do
  link '献立詳細', menu_path
  parent :likes_menus_path # お気に入り一覧
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).