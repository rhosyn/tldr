require 'aylien_news_api'

class AylienApiJob < ApplicationJob
  queue_as :aylien_api

  def perform
    AylienNewsApi.configure do |config|
      config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = '54255824'
      config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'ba9024a8043e591e8368ba8f6a1e4bf6'
    end

    api_instance = AylienNewsApi::DefaultApi.new
    categories = %w(IAB1 IAB3 IAB7 IAB15 IAB17 IAB19)
    categories.each do |category|
      opts = {
        :categories_taxonomy => 'iab-qag',
        :categories_id => [category],
        :published_at_start => "NOW-3DAYS",
        :published_at_end => "NOW",
        :media_images_count_min => 1,
        :language => ['en'],
        :not_source_scopes_level => ["local"],
        :sort_by => 'source.rankings.alexa.rank.US',
        :source_rankings_alexa_rank_min => 1,
        :source_rankings_alexa_rank_max => 200,
        :per_page => 20
      }


      begin
        result = api_instance.list_stories(opts)
        result.stories.each do |s|
          ay_article = AylienArticle.new(aylien_article_id: s.id,
                                    title: s.title,
                                    img_url: s.media[0].url,
                                    body_polarity_sentiment: s.sentiment.body.polarity,
                                    body_polarity_score: s.sentiment.body.score,
                                    title_polarity_sentiment: s.sentiment.title.polarity,
                                    title_polarity_score: s.sentiment.title.score,
                                    published_at: s.published_at,
                                    related_stories_url: s.links.related_stories,
                                    coverages_url: s.links.coverages)
          ay_article.fb_shares = s.social_shares_count.facebook[0].count if s.social_shares_count.facebook[0]
          ay_article.li_shares = s.social_shares_count.linkedin[0].count if s.social_shares_count.linkedin[0]
          ay_article.reddit_shares = s.social_shares_count.reddit[0].count if s.social_shares_count.reddit[0]
          ay_article.goog_shares = s.social_shares_count.google_plus[0].count if s.social_shares_count.google_plus[0]
          if s.links.permalink.match(/&url=(?<url>\S[^&]*)/).nil?
            ay_article.article_url = s.links.permalink
          else
            ay_article.article_url = s.links.permalink.match(/&url=(?<url>\S[^&]*)/)["url"]
          end
          if AylienSource.where(source_name: s.source.name).empty?
            news_source = AylienSource.new(source_name: s.source.name,
                                  source_id: s.source.id,
                                  img_url: s.source.logo_url)
          else
            news_source = AylienSource.where(source_name: s.source.name).first
          end
          news_source.loc_country = s.source.locations[0].city if s.source.locations[0]
          news_source.alexa_rank = s.source.rankings.alexa[0].rank if s.source.rankings.alexa
          news_source.save
          ay_article.aylien_source = news_source
          s.hashtags.each do |hashtag|
            if AylienHashtag.where(hashtag: hashtag).empty?
              h = AylienHashtag.new(hashtag: hashtag)
              h.save!
            else
              h = AylienHashtag.where(hashtag: hashtag).first
            end
            article_hashtag = ArticleHashtag.new
            article_hashtag.aylien_hashtag = h
            article_hashtag.aylien_article = ay_article
            article_hashtag.save!
          end
          s.keywords.each do |keyword|
            if AylienKeyword.where(keyword: keyword).empty?
              k = AylienKeyword.new(keyword: keyword)
              k.save!
            else
              k = AylienKeyword.where(keyword: keyword).first
            end
            aylien_article_keyword = AylienArticleKeyword.new
            aylien_article_keyword.aylien_keyword = k
            aylien_article_keyword.aylien_article = ay_article
            aylien_article_keyword.save!
          end
          s.categories.each do |category|
            if AylienCategory.where(iab: category.id).empty?
              c = AylienCategory.new(iab: category.id)
              c.save!
            else
              c = AylienCategory.where(iab: category.id).first
            end
            article_category = ArticleCategory.new
            article_category.confident = category.confident
            article_category.score = category.score
            article_category.aylien_article = ay_article
            article_category.aylien_category = c
            article_category.save!
          end
          ay_article.save!
        end

      rescue AylienNewsApi::ApiError => e
        puts "Exception when calling DefaultApi->list_stories: #{e}"
        puts e.response_body
      rescue ActiveRecord::RecordInvalid
        puts "Element already exists"
      end
    end
  end
end

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
