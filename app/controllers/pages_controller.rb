class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @aylien_articles = AylienArticle.all.reject {|a| a.summary_sentences.nil? }
    @frontend_articles = []
    @aylien_articles.each do |article|
      cats = ArticleCategory.where(aylien_article: article)
      iab = cats.select{|c| c.aylien_category.iab.length <= 5 } if cats.select{|c| c.aylien_category.iab.length <= 5 } != []
      if iab && article.summary_sentences != nil
        carousel_item = {
                        id: article.id,
                        title: article.title,
                        image_url: article.img_url,
                        category: iab[0].aylien_category.category,
                        sentiment: article.title_polarity_sentiment
                        }
        @frontend_articles << carousel_item
      end
    end

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

