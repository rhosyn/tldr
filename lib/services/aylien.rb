require 'aylien_news_api'

AylienNewsApi.configure do |config|
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = '6c9ca2b0'
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = '6564a24a204044b1cfb196c6f43c9243'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = {
  :categories_taxonomy => 'iab-qag',
  :categories_id => ['IAB19'],
  :published_at_start => "NOW-2DAYS",
  :published_at_end => "NOW",
  :media_images_count_min => 1,
  :media_images_count_max => 5,
  :language => ['en'],
  :not_language => ['it', 'es'],
  :sort_by => 'social_shares_count',
  :source_rankings_alexa_rank_min => 1,
  :source_rankings_alexa_rank_max => 170,

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
  a = result.stories.first
  puts "=========================="
  puts "id = #{a.id}"
  puts "=========================="
  puts "title = #{a.title}"
  puts "=========================="
  puts "body = #{a.body}"
  puts "=========================="
  puts "summary = #{a.summary}"
  puts "=========================="
  puts "summary sentences = #{a.summary.sentences}"
  puts "=========================="
  puts "source name = #{a.source.name}"
  puts "=========================="
  puts "media = #{a.media}"
  puts "=========================="
  puts "sentiment = #{a.sentiment}"
  puts "=========================="
  puts "keywords = #{a.keywords}"
  puts "=========================="
  puts "language = #{a.language}"
  puts "=========================="
  puts "published_at = #{a.published_at}"
  puts "=========================="
  puts "links = #{a.links}"
  # puts result
  # result.stories.each do |story|
  # puts "#{story.title} / #{story.source.name}"
  # end
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_stories: #{e}"
  puts e.response_body
end



