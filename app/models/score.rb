class Score < ApplicationRecord
  has_many :pages, dependent: :destroy
  belongs_to :collection
  belongs_to :composer
  has_one_attached :file

  GENRES = ["Rock", "Classique", "R&B", "Pirate Metal", "Reggae", "Opera", "k-pop"]
end
