require 'news-api'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @news = getnews
  end


  def getnews
    # newsapi = News.new("2e708082020e4249b6dd845def387af1")
    # top_headlines = newsapi.get_top_headlines(category: 'business', language: 'en')
  end


end

