class Post < ApplicationRecord
  belongs_to :user
  belongs_to :training
  has_many :likes
  has_many :comments
end
