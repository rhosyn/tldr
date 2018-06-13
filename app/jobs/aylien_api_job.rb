require 'aylien_news_api'

class AylienApiJob < ApplicationJob
  queue_as :aylien_api

  def perform
    # Do something later
  end
end
