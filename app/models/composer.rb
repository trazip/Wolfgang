class Composer < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_one_attached :picture
end
