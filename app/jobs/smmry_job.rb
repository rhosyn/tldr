require 'open-uri'
require 'json'

class SmmryJob < ApplicationJob
  queue_as :smmry

  def perform()
    AylienArticle.all.each do |a|
      if a.summary_sentences.nil?
        news_url = a.article_url
        url = "http://api.smmry.com/&SM_API_KEY=#{ENV['Smmry_API_Key']}&SM_WITH_BREAK&SM_WITH_ENCODE&SM_QUOTE_AVOID&SM_QUESTION_AVOID&SM_EXCLAMATION_AVOID&SM_KEYWORD_COUNT=10&SM_LENGTH=5&SM_URL=#{news_url}"
        smmry = JSON.parse(open(url).read)
        a.summary_sentences = smmry["sm_api_content"].strip.gsub(/\&#039;/, "'").split("[BREAK]").each {|s| s.strip } if smmry["sm_api_content"]
        a.save
        sleep(11)
      end
    end
  end
end
