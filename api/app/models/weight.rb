class Weight < ApplicationRecord
  validates :weight, {presence: true, numericality: true}
  validates :user_id, presence: true
  belongs_to :user
end
