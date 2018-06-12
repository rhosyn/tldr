class Article < ApplicationRecord
  validates :newsapi_articleurl, uniqueness: true, presence: true
  after_save  :async_update

  private

  def async_update
    SmmryJob.perform_later(self.id)
  end
end
