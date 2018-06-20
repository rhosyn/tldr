class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @aylien_articles = AylienArticle.all.order(published_at: :desc).reject {|a| a.summary_sentences.nil? }
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
                        title_sentiment: article.title_polarity_sentiment,
                        body_sentiment: article.title_polarity_sentiment,
                        day: article.published_at.day,
                        month: Date::MONTHNAMES[article.published_at.month],
                        year: article.published_at.year
                        }
        @frontend_articles << carousel_item
      end
      hp = AylienArticle.where(:title_polarity_sentiment => 'positive', :body_polarity_sentiment => 'positive')
      @happy_articles = hp.order(body_polarity_sentiment: :desc)
      @happy_things = []
      @happy_articles.each do |happy|
        if happy.summary_sentences != nil
          carousel_happy = {
                          id: happy.id,
                          title: happy.title,
                          image_url: happy.img_url,
                          category: iab[0].aylien_category.category,
                          title_sentiment: happy.title_polarity_sentiment,
                          body_sentiment: happy.title_polarity_sentiment,
                          day: happy.published_at.day,
                          month: Date::MONTHNAMES[happy.published_at.month],
                          year: happy.published_at.year
                          }
          @happy_things << carousel_happy
        end
      end
    end

    @aylien_snippets = {}
    @aylien_articles.each do |aylien|
      ay_snippets = aylien.summary_sentences.gsub!("[","").gsub!("]","").split("\",").to_a
      ay_snippets.select{ |s| s.strip[0] == "\""}.map!{|snippet| snippet.strip.gsub!("\"","").strip}
      @aylien_snippets[aylien.id] = [ay_snippets, aylien.article_url]
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

  def history
    clicks = Ahoy::Event.where(name: 'article_click').order(time: :desc)
    @history = {}
    # raise
    clicks.each do |click|
      date = "#{click.time.year}-#{click.time.month}-#{click.time.day}"
      @history[date] = [] if !@history.keys.include?(date)
      article = AylienArticle.find(click.properties['article_id'])
      @history[date] << article if article
    end
  end


  def my_articles
    popular_categories = {}
    clicked_articles = []
    article_cnt = 0
    article_click_events = Ahoy::Event.where(name: 'article_click')
    article_click_events.each do |e|
      next if e.properties['article_id'].nil?
      article = AylienArticle.find(e.properties['article_id'])
      clicked_articles << article if !clicked_articles.index(article)
      article.aylien_categories.each do |c|

        # do non-mainstream categories
        next if c.iab.index('-').nil? || c.iab.index('IAB').nil? || c.category.nil?
        popular_categories[c.iab] = 0 if !popular_categories.keys.include?(c.iab)
        popular_categories[c.iab] = popular_categories[c.iab] + 1
        article_cnt += 1
      end
    end

    # Popular sub-categories ranked by frequency
    popular_categories.sort_by{|_key,value| value}.reverse.to_h
  end
end

