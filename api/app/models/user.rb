# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :height, {numericality: true, allow_nil: true}
  validates :sex, {numericality: true, allow_nil: true}
  validates :training_type, {numericality: true, allow_nil: true}
  has_many :weights
  has_many :trainings
  has_many :histories
  has_many :history_trainings, through: :histories, source: :training
  has_many :posts
  has_many :post_trainings, through: :posts, source: :training
  has_many :likes
  has_many :comments
  has_many :comment_posts, through: :comments, source: :post
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end
end
