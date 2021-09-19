class History < ApplicationRecord
  attr_accessor :training_name
  belongs_to :user
  belongs_to :training
end
