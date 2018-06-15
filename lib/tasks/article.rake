namespace :article do
  desc "Pulling new articles from News_API and updating with SMMRY..."
  task pull_new_articles: :environment do
    AylienApiJob.perform_now
    # NewsApiJob.perform_now
    # SmmryJob.perform_later
  end

end
