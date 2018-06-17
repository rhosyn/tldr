class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :aylien_article_user_batches
  has_many :batches, through: :aylien_article_user_batches
  has_many :aylien_article_batches, through: :batches
  has_many :aylien_articles, through: :aylien_article_batches
end
