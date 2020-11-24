class Score < ApplicationRecord
  has_many :pages
  belongs_to :collection
  has_one_attached :file
end
