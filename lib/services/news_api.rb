# require 'news-api'

class NewsApi
  def retrieve
    newsapi = News.new(ENV['NEWSAPI_API'])
    categories = %w(top-headlines business entertainment general health science sports technology).to_a
    categories.each do |category|
      if category == 'top-headlines'
        top_headlines = newsapi.get_top_headlines(sortBy: 'popularity')
      else
        top_headlines = newsapi.get_top_headlines(category: category, sortBy:'popularity')
      end
      count = 0
      top_headlines.each do |a|
        count += 1
        article = Article.new(newsapi_title: a['title'],
                              newsapi_description: a['description'],
                              newsapi_imgeurl: a['urlToImage'],
                              newsapi_articleurl: a['url'],
                              newsapi_author: a['author'],
                              newsapi_publishedat: DateTime.parse(a['publishedAt']).to_date,
                              newsapi_source_id: a['id'],
                              newsapi_source_name: a['name'],
                              newsapi_resultno: count,
                              newsapi_category: category)
        article.save!
      # rescue
      end
    end
  end
end



