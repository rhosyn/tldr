require 'aylien_news_api'

class Aylien
  def retrieve
    AylienNewsApi.configure do |config|
      config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = '54255824'
      config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'ba9024a8043e591e8368ba8f6a1e4bf6'
    end
    api_instance = AylienNewsApi::DefaultApi.new

    opts = {
      :categories_taxonomy => 'iab-qag',
      :categories_id => ['IAB19'],
      :published_at_start => "NOW-1DAY",
      :published_at_end => "NOW",
      :media_images_count_min => 1,
      :media_images_count_max => 5,
      :language => ['en'],
      :not_language => ['it', 'es'],
      :sort_by => 'source.rankings.alexa.rank.US',
      :source_rankings_alexa_rank_min => 1,
      :source_rankings_alexa_rank_max => 170,
      :per_page => 3
    }

    # :source_locations_country => ['IN']
    # :title => 'trump',
    # :sort_by => 'source.rankings.alexa.rank.US'
    # :sort_by => 'social_shares_count' includes facebook, LI, Reddit and Google+

    # ranks websites based on the volume of traffic they have generated over the previous 3 months
    # Google.com has a ranking of 1, BBC.co.uk has a ranking of around 100, and so on.

    # Categories
    # ['IAB1'] = arts & entertainment
    # ['IAB3'] = business
    # ['IAB7'] = Health and fitness
    # ['IAB15'] = science
    # ['IAB17'] = sports
    # ['IAB19'] = technology & computing

    begin
      result = api_instance.list_stories(opts)
      result.stories.each do |s|
        ay_article = AylienArticle.new(aylien_article_id: s.id,
                                  title: s.title,
                                  summary_sentences: s.summary.sentences,
                                  image_url: story.media[0].url,
                                  source_logo_url: s.source.logo_url if s.source.logo_url != nil,
                                  body_polarity_sentiment: s.sentiment.body.polarity,
                                  body_polarity_score: s.sentiment.body.score,
                                  title_polarity_sentiment: s.sentiment.body.score,
                                  title_polarity_score: s.sentiment.title.polarity,
                                  newsapi_resultno: s.sentiment.title.score,
                                  published_at: s.published_at,
                                  article_url: s.links.permalink,
                                  related_stories_url: s.links.related_stories,
                                  coverages_url: s.links.coverages,
                                  fb_shares: s.social_shares_count.facebook[0].count,
                                  li_shares: s.social_shares_count.linkedin[0].count,
                                  reddit_shares: s.social_shares_count.reddit[0].count,
                                  goog_shares: s.social_shares_count.google_plus[0].count)
        news_source = AylienSource.new(source_name: s.source.name,
                              source_id: s.source.id,
                              loc_country: s.source.locations[0].city,
                              alexa_rank: s.source.rankings.alexa[0].rank)
        news_source.save!
        ay_article.aylien_source = news_source
        s.hashtags.each do |hashtag|
          h = AylienHashtag.new(hashtag: hashtag)
          h.save!
          article_hashtag = ArticleHashtag.new
          article_hashtag.aylien_hashtag = AylienHashtag.where(hashtag: hashtag)
          article_hashtag.aylien_article = ay_article
          article_hashtag.save!
        end
        s.keywords.each do |keyword|
          k = AylienKeyword.new(keyword: keyword)
          k.save!
          article_keyword = AylienArticleKeyword.new
          article_keyword.aylien_keyword = AylienKeyword.where(keyword: keyword)
          article_keyword.aylien_article = ay_article
          article_keyword.save!
        end
        s.categories.each do |category|
          k = AylienCategory.new(category: category)
          k.save!
          article_category = ArticleCategory.new
          article_category.confident = category.confident
          article_category.score = category.score
          article_category.aylien_category = AylienCategory.where(iab: category.id)
          article_category.aylien_article = ay_article
          article_category.save!
        end
      ay_article.save!

    rescue AylienNewsApi::ApiError => e
      puts "Exception when calling DefaultApi->list_stories: #{e}"
      puts e.response_body
    end
  end
end
      # result.stories.each do |story|
      #   puts "#{story.title} / #{story.source.name}"
      # end
