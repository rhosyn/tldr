# require 'news-api'

class NewsApi
  def retrieve
    newsapi = News.new(ENV['NEWSAPI_API'])
    categories = %w(business entertainment general health science sports technology).to_a
    categories.each do |category|
      top_headlines = newsapi.get_top_headlines(category: category, country: 'gb')
      count = 0
      top_headlines.each do |a|
        begin
          count += 1
          a.publishedAt.nil? ? date = DateTime.now : date = DateTime.parse(a.publishedAt).to_date
          article = Article.new(newsapi_title: a.title,
                                newsapi_description: a.description,
                                newsapi_imgeurl: a.urlToImage,
                                newsapi_articleurl: a.url,
                                newsapi_author: a.author,
                                newsapi_publishedat: date,
                                newsapi_source_id: a.id,
                                newsapi_source_name: a.name,
                                newsapi_resultno: count,
                                newsapi_category: category)
          article.save!
        rescue ActiveRecord::RecordInvalid
            puts "Article already exists: #{article.newsapi_articleurl}"
        end
      end
    end
  end
end



