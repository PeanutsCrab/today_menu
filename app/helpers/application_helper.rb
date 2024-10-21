module ApplicationHelper
  def page_title(title = '')
    base_title = '今日何食べる？'
    title.present? ? "#{title} | #{base_title}" : "今日何食べる？"
  end

  def default_meta_tags
    {
      site: '今日何食べる？',
      title: '今日の献立・献立を考える手間を省くサービス',
      reverse: true,
      charset: 'utf-8',
      description: '今日何食べる？では、献立を考える手間を省き、シンプルに楽しく食事を楽しむことができます。',
      keywords: '献立,食事,料理,今日何食べる',
      canonical: request.original_url,
      separator: '|',
      og:{
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        image: image_url('ogp.png')
      }
    }
  end
end
