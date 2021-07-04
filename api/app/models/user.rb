# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :height, numericality: true
  validates :sex, numericality: true
  validates :training_type, numericality: true
  VALID_DATE_REGIX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :birthday, format: { with: VALID_DATE_REGIX }
  has_many :weights
end
