class Page < ApplicationRecord
  belongs_to :score
  has_one :annotation, dependent: :destroy
  has_one_attached :file
end
