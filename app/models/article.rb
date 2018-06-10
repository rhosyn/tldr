class Article < ApplicationRecord
  validates :newsapi_articleurl, uniqueness: true, presence: true
end
