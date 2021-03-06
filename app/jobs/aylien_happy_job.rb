require 'aylien_news_api'

class AylienHappyJob < ApplicationJob
  queue_as :default

  def perform
    categories = %w(IAB1 IAB19 IAB15 IAB11 IAB17 IAB7 IAB3)
      categories.each do |category|

        AylienNewsApi.configure do |config|
          config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = ENV['Aylien_App_ID']
          config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = ENV['Aylien_App_Key']
        end

        api_instance = AylienNewsApi::DefaultApi.new

        opts = {
          :categories_taxonomy => 'iab-qag',
          :categories_id => [category],
          :categories_confident => true,
          :sentiment_body_polarity => "positive",
          :sentiment_title_polarity => "positive",
          :published_at_start => "NOW-1DAY",
          :published_at_end => "NOW",
          :media_images_count_min => 1,
          :language => ['en'],
          :not_source_scopes_level => ["local"],
          :sort_by => 'social_shares_count',
          :not_source_id => 700,
          :not_source_locations_country => ['IN'],
          :source_rankings_alexa_rank_min => 1,
          :source_rankings_alexa_rank_max => 350,
          :sort_direction => 'desc',
          :per_page => 20
        }

              begin
        result = api_instance.list_stories(opts)
        result.stories.each do |s|
        keyword_array = []
          s.keywords.each do |keyword|
            keyword_array << keyword.downcase
          end
          joint_array = []
          AylienArticle.all.each do |a|
            check_array = a.aylien_keywords.first(5).map {|k| k.keyword.downcase}
            intersection = check_array & keyword_array
            if intersection.length > 2
              joint_array << a
            end
          end
          if joint_array == []
            if AylienArticle.where(title: s.title).empty?
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
          end
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
