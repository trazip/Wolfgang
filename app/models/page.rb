class Page < ApplicationRecord
  belongs_to :score
  has_one_attached :file
end
