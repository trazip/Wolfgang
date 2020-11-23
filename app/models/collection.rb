class Collection < ApplicationRecord
  belongs_to :user
  has_many :scores
end
