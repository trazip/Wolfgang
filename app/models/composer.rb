class Composer < ApplicationRecord
  has_many :scores
  has_one_attached :picture
end
