require 'open-uri'
require 'json'

class Smmry
  def summarize
    url = "http://api.smmry.com/&SM_API_KEY=#{ENV['Smmry_API_Key']}&SM_WITH_BREAK&SM_WITH_ENCODE&SM_QUOTE_AVOID&SM_QUESTION_AVOID&SM_EXCLAMATION_AVOID&SM_KEYWORD_COUNT=10&SM_LENGTH=10&SM_URL=#{news_url}"
    Article.all.each do |a|
      if a.smmry_content != nil?
        news_url = a.newsapi_articleurl
        smmry = JSON.parse(open(url).read)
        a.smmry_keywords = smmry["sm_api_keyword_array"]
        a.smmry_content = smmry["sm_api_content"].strip.gsub(/\&#039;/, "'").split("[BREAK]").each {|s| s.strip } if smmry["sm_api_content"]
        a.smmry_charcount = smmry["sm_api_character_count"]
        a.smmry_contentreduced = smmry["sm_api_content_reduced"]
        a.save
        sleep(11)
      end
    end
  end

end
