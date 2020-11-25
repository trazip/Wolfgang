class Page < ApplicationRecord
  belongs_to :score
  has_one :annotation
  has_one_attached :file
end
