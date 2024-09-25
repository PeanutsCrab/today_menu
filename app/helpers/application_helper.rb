module ApplicationHelper
  def page_title(title = '')
    base_title = '今日何食べる？'
    title.present? ? "#{title} | #{base_title}" : "今日何食べる？"
  end
end
