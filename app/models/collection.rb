class Collection < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_one_attached :photo
end
