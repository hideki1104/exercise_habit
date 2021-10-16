class Training < ApplicationRecord
  validates :name, presence: true
  validates :url, {presence: true, length: {minimum: 11, maximum: 11}}
  validates :training_type, {presence: true, numericality: true}
  validates :difficuly_type, {presence: true, numericality: true}
  validates :genre_id, {presence: true, numericality: true}
  belongs_to :genre
  has_many :users
  has_many :histories
  has_many :users, through: :histories
  has_many :posts
  has_many :users, through: :posts
end
