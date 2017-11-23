class User < ApplicationRecord
  validates :name, presence: true
  validates :name,    length: { minimum: 5 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments

  has_secure_password
end
