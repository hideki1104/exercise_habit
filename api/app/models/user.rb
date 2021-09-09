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
end
