class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @article = Article.first
    @articles = Article.all
  end

end

