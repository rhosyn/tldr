class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @article = Article.first
    @articles = Article.all
    @snippets = {}
    @articles.each do |a|
      if a.smmry_content
        article_snippets = a.smmry_content.gsub!("[","").gsub!("]","").split("\",").to_a
        article_snippets.select{ |s| s.strip[0] == "\""}.map!{|snippet| snippet.strip.gsub!("\"","").strip}
        @snippets[a.id] = article_snippets
      end
    end
  end

end

# @articles = AylienArticle.all
# @articles.each do |a|
#   article_snippets = a.summary_sentences.gsub(/\"/, "").gsub(/\\/, "").tr("[","").tr("]","").split(",")

