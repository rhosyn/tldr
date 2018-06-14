class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @aylien_articles = AylienArticle.all.reject {|a| a.summary_sentences.nil? }
    @aylien_snippets = {}
    @aylien_articles.each do |aylien|
      ay_snippets = aylien.summary_sentences.gsub!("[","").gsub!("]","").split("\",").to_a
      ay_snippets.select{ |s| s.strip[0] == "\""}.map!{|snippet| snippet.strip.gsub!("\"","").strip}
      @aylien_snippets[aylien.id] = ay_snippets
    end
  end

  def index
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

